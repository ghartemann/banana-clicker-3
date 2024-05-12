extends Node

func save_game():
	var save_game = FileAccess.open("user://bc_save.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		
		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		print(json_string + ' saved')
		save_game.store_line(json_string)
	
	print(save_game.get_path_absolute())

func load_game():
	if not FileAccess.file_exists("user://bc_save.save"):
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_game = FileAccess.open("user://bc_save.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var node_data = json.get_data()

		# Firstly, we need to create the object.
		var new_object = load(node_data["filename"]).instantiate()

		# Check if a node with the same name already exists and remove it if it does.
		var parent_node = get_node(node_data["parent"])

		if parent_node.has_node(node_data["name"]):
			var test = parent_node.get_node(node_data["name"])
			test.queue_free()

		# Now add the new object to the parent node and set its name.
		parent_node.add_child(new_object)
		new_object.name = node_data["name"]

		# Now we set the remaining variables.
		for i in node_data.keys():
			new_object.set(i, node_data[i])

static func format_for_display(value) -> String:
	var display_val = str(snapped(value, 1))
	
	if (value > 1000 and value <= 1000000):
		display_val = str(snapped(value / 1000, 0.01)) + ' k'
	elif (value > 1000000 and value <= 1000000000):
		display_val = str(snapped(value / 1000000, 0.001)) + ' M'
	elif (value > 1000000000):
		display_val = str(snapped(value / 1000000000, 0.01)) + ' B'
	
	return display_val

static func import_json(path: String) -> Array:
	var file = FileAccess.open(path, FileAccess.READ).get_as_text()
	
	return JSON.new().parse_string(file)

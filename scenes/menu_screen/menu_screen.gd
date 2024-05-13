extends Control

var main_scene: PackedScene = preload("res://scenes/Main.tscn")

func _ready():
	$Options.get_child(0).hide()

func _process(delta):
	pass

func _on_button_start_pressed():
	get_tree().change_scene_to_packed(main_scene)

func _on_button_options_pressed():
	$Options.get_child(0).show()

func _on_button_about_pressed():
	pass # Replace with function body. TODO

func _on_button_exit_pressed():
	get_tree().quit()

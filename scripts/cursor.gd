extends Node

const default_cursor = preload("res://assets/cursors/resized/left_ptr2.svg")
const pointer_cursor = preload("res://assets/cursors/resized/hand2.svg")

static func change_cursor(hovering: bool):
	if hovering == true:
		Input.set_custom_mouse_cursor(pointer_cursor)
	else:
		Input.set_custom_mouse_cursor(default_cursor)

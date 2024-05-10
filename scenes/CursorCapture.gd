extends Control

signal cursor(position)

var cursor_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton:
		pass
		#print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		cursor_position = event.position
		cursor.emit(event.position)
		#print("Mouse Motion at: ", event.position)

	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)

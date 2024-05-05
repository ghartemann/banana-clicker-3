extends Node2D

var bananas = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	button.text = "Click me"
	button.pressed.connect(self._click)
	add_child(button)
	$Label.text = str(bananas)
	$Label.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _click():
	bananas = bananas + 1
	print(bananas)
	$Label.text = str(bananas)

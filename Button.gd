extends Button

var bananas = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	button.text = "Banane" + str(bananas)
	button.pressed.connect(self._click)
	add_child(button)

func _click():
	bananas += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

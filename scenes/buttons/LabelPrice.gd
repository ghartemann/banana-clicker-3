extends Label

var utils = preload("res://scripts/Utils.gd")

var value: float
var type: String


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = '🍌 ' + utils.format_for_display(value)

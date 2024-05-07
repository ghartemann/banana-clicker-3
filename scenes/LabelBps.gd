extends Label

const utils = preload("res://scenes/Utils.gd")
var value: float = 0

func _process(_delta):
	text = 'BPS : ' + utils.format_for_display(value)

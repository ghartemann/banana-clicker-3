extends Label

const utils = preload("res://scripts/Utils.gd")
var value: float = 0

func _process(_delta):
	text = 'Bananes (total) : ' + utils.format_for_display(value)

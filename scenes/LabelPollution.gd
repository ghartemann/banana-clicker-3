extends Label

const utils = preload("res://scripts/Utils.gd")
var value: float = 0

func _process(_delta):
	text = 'Pollution : ' + utils.format_for_display_co2(value) + ' eq/CO2'

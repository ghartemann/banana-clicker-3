extends Label

var value: float = 0

func _process(delta):
	text = 'BPC : ' + str(snapped(value, 1))

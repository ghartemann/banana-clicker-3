extends Label

var value: float = 0

func _process(_delta):
	text = 'BPC : ' + str(snapped(value, 1))

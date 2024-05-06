extends Label

var value: float = 0

func _process(_delta):
	text = 'BPS : ' + str(snapped(value, 1))

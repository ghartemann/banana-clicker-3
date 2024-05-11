static func format_for_display(value: float) -> String:
	var toReturn: String
	var unit: String
	
	if value < 1000:
		value = snapped(value, 1)
	elif (value >= 1000 and value < 1000000):
		value = snapped(value / 1000, 0.01)
		unit = 'K'
	elif (value >= 1000000 and value < 1000000000):
		value = snapped(value / 1000000, 0.01)
		unit = 'M'
	elif (value >= 1000000000):
		value = snapped(value / 1000000000, 0.01)
		unit = 'B'
	elif (value >= 1000000000000):
		value = snapped(value / 1000000000000, 0.01)
		unit = 'T'
	elif (value >= 1000000000000000):
		value = snapped(value / 1000000000000000, 0.01)
		unit = 'Q'
	elif (value >= 1000000000000000000):
		value = snapped(value / 1000000000000000000, 0.01)
		unit = 'S'
	elif (value >= 1000000000000000000000):
		value = snapped(value / 1000000000000000000000, 0.01)
		unit = 'O'
	elif (value >= 1000000000000000000000000):
		value = snapped(value / 1000000000000000000000000, 0.01)
		unit = 'N'
	elif (value >= 1000000000000000000000000000):
		value = snapped(value / 1000000000000000000000000000, 0.01)
		unit = 'D'
	elif (value >= 1000000000000000000000000000000):
		value = snapped(value / 1000000000000000000000000000000, 0.01)
		unit = 'U'
	
	toReturn = str(value)
	
	if unit:
		toReturn += unit
	
	return toReturn

static func import_json(path: String) -> Array:
	var file = FileAccess.open(path, FileAccess.READ).get_as_text()
	
	return JSON.new().parse_string(file)

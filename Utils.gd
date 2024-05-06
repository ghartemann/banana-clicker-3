static func format_for_display(value) -> String:
	var display_val = str(snapped(value, 1))
	
	if (value > 1000 and value <= 1000000):
		display_val = str(snapped(value / 1000, 0.01)) + ' k'
	elif (value > 1000000 and value <= 1000000000):
		display_val = str(snapped(value / 1000000, 0.001)) + ' M'
	elif (value > 1000000000):
		display_val = str(snapped(value / 1000000000, 0.01)) + ' B'
	
	return display_val

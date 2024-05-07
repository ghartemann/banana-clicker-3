extends Button

var type: String = 'bpc'

var price: int = 100:
	set(new_val):
		price = new_val
	get:
		return price

var price_multiplier: float = 1.14:
	set(new_val):
		price_multiplier = new_val
	get:
		return price_multiplier

var value: float = 1:
	set(new_val):
		value = new_val
	get:
		return value

var nb_owned: int = 0:
	set(new_val):
		nb_owned = new_val
	get:
		return nb_owned

var clicker_name: String = "Super curseur":
	set(new_val):
		clicker_name = new_val
	get:
		return clicker_name


# Called when the node enters the scene tree for the first time.
func _ready():
	set_button_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_button_text()

func set_button_text():
	text = clicker_name + ' (+' + str(value) + type + ' - ' + str(nb_owned) + ' owned - ' + str(price) + ' $)'

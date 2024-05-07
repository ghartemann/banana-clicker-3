extends Button

signal buy(type, value, price)

var type: String:
	set(new_val):
		type = new_val
		$LabelValue.type = new_val
	get:
		return type

var price: int:
	set(new_val):
		price = new_val
		$LabelPrice.text = '🍌 ' + str(new_val)
	get:
		return price

var price_multiplier: float:
	set(new_val):
		price_multiplier = new_val
	get:
		return price_multiplier

var value: float:
	set(new_val):
		value = new_val
		$LabelValue.value = str(new_val)
	get:
		return value

var nb_owned: int:
	set(new_val):
		nb_owned = new_val
		$LabelOwned.text = str(new_val)
	get:
		return nb_owned

var clicker_name: String:
	set(new_val):
		clicker_name = new_val
		$LabelText.text = new_val
	get:
		return clicker_name


func _ready():
	set_button_text()
	buy.connect(Callable(get_node("/root/Main"), "_on_buy"))

func _process(_delta):
	set_button_text()
	
func _pressed():
	buy_clicker()

func set_button_text():
	pass

func buy_clicker():
	buy.emit(type, value, price)
	
	price *= price_multiplier
	nb_owned += 1

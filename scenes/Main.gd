extends Control

var button_clicker: PackedScene = preload("res://scenes/buttons/ButtonClicker.tscn")
var utils = preload("res://scripts/Utils.gd")

#################### Variables
var bananas: float = 0:
	set(new_val):
		bananas = new_val
		%LabelBananas.value = bananas
	get:
		return bananas

var bananas_total: int = 0
var bananas_total_bpc: int = 0

var bps: float = 0:
	set(new_val):
		bps = new_val
		%LabelBps.value = bps
	get:
		return bps

var bpc: float = 1:
	set(new_val):
		bpc = new_val
		%LabelBpc.value = bpc
	get:
		return bpc


#################### Inbuilt functions
func _ready():
	bananas = bananas
	bps = bps
	bpc = bpc
	
	instantiate_buttons()

func _process(delta):
	increment_via_bps(delta)
	disable_expensive_clickers()


#################### Init functions
func instantiate_buttons():
	var imported_clickers = utils.import_json("res://json/clickers.json")

	for clicker in imported_clickers:
		var button = button_clicker.instantiate()

		var child_button = button.get_child(0)
		
		child_button.clicker_name = clicker.name
		child_button.value = clicker.value
		child_button.type = clicker.type
		child_button.price = clicker.price
		child_button.price_multiplier = clicker.price_multiplier
		
		child_button.disabled = false
		child_button.nb_owned = 0
		
		if clicker.type == 'bps':
			%ClickerSection.add_child(button)
		elif clicker.type == 'bpc':
			%BuffSection.add_child(button)


#################### Custom functions
func increment_bananas(amount: float):
	bananas += amount
	bananas_total += amount

func increment_via_bps(delta: float):
	increment_bananas(bps * delta)

func increment_via_bpc():
	increment_bananas(bpc)
	bananas_total_bpc += bpc
	
func increment_bps(amount: float):
	bps += amount
	
func increment_bpc(amount: float):
	bpc += amount

func _on_button_main_pressed():
	increment_via_bpc()

func disable_expensive_clickers():
	for c in %ClickerSection.get_children():
		c.get_child(0).disabled = bananas < c.get_child(0).price
	
	for b in %BuffSection.get_children():
		b.get_child(0).disabled = bananas < b.get_child(0).price

func _on_buy(type: String, value: float, price: float):
	print('parent')
	if (type == 'bps'):
		increment_bps(value)
	elif (type == 'bpc'):
		increment_bpc(value)
		
	increment_bananas(-price)

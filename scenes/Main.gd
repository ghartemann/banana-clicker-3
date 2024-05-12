extends Control

var button_clicker: PackedScene = preload("res://scenes/buttons/ButtonClicker.tscn")
var utils = preload("res://scripts/Utils.gd")

#################### Variables
var language: String = 'fr'
var cursor_position: Vector2

var bananas: float = 0:
	set(new_val):
		bananas = new_val
		%LabelBananas.value = bananas
	get:
		return bananas

var bananas_total: float = 0:
	set(new_val):
		bananas_total = new_val
		%LabelBananasTotal.value = new_val
	get:
		return bananas_total

var pollution_total: float = 0:
	set(new_val):
		pollution_total = new_val
		%LabelPollution.value = new_val
	get:
		return pollution_total

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


#################### Built-in functions
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

		var child_button = button.get_node("Button")
		
		child_button.clicker_name = clicker.name[language]
		child_button.value = clicker.value
		child_button.type = clicker.type
		child_button.price = clicker.price
		child_button.price_multiplier = clicker.price_multiplier
		child_button.picture_path = clicker.picture_path
		child_button.description = clicker.description[language]
		
		child_button.disabled = false
		child_button.nb_owned = 0
		
		if clicker.type == 'bps':
			%ClickerSection.add_child(button)
		elif clicker.type == 'bpc':
			%BuffSection.add_child(button)


#################### Custom functions
func increment_bananas(amount: float) -> void:
	bananas += amount

	if amount > 0:
		bananas_total += amount
		pollution_total += (amount * 160) / 1000

func increment_via_bps(delta: float) -> void:
	increment_bananas(bps * delta)

func increment_via_bpc() -> void:
	increment_bananas(bpc)

func increment_bp(amount: float, type: String) -> void:
	self[type] += amount

func _on_button_main_pressed() -> void:
	increment_via_bpc()

func disable_expensive_clickers() -> void:
	for b in %ClickerSection.get_children() + %BuffSection.get_children():
		b.get_node("Button").disabled = bananas < b.get_node("Button").price

func _on_buy(type: String, value: float, price: float) -> void:
	increment_bp(value, type)
	increment_bananas(-price)

func _on_cursor_capture_cursor(position) -> void:
	cursor_position = position

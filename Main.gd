extends Node2D

#################### Variables
var bananas: float = 0:
	set(new_val):
		bananas = new_val
		%LabelBananas.value = bananas
	get:
		return bananas

var bps: float = 0:
	set(new_val):
		bps = new_val
		%LabelBps.value = bps
	get:
		return bps

var bpc: float = 10:
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

func _process(delta):
	increment_via_bps(delta)
	
	for c in %ClickerSection.get_children():
		c.disabled = bananas < c.price


#################### Custom functions
func increment_bananas(amount: float):
	bananas += amount

func increment_via_bps(delta: float):
	increment_bananas(bps * delta)

func increment_via_bpc():
	increment_bananas(bpc)
	
func increment_bps(amount: float):
	bps += amount
	
func increment_bpc(amount: float):
	bpc += amount

func _on_button_main_pressed():
	increment_via_bpc()

func buy_clicker(node_name):
	increment_bps(node_name.bps)
	increment_bananas(-node_name.price)
	node_name.nb_owned += 1
	node_name.price *= node_name.price_multiplier

func _on_button_autoclicker_pressed():
	buy_clicker(%ButtonAutoclicker)

func _on_button_bananier_pressed():
	buy_clicker(%ButtonBananier)

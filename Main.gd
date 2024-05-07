extends Node2D

#################### Variables
var bananas: float = 0:
	set(new_val):
		bananas = new_val
		%LabelBananas.value = bananas
	get:
		return bananas

var bananas_total: int = 0
var bananas_total_bpc: int = 0

var bps: float = 20:
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

func _process(delta):
	increment_via_bps(delta)
	disable_expensive_clickers()


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

func buy_clicker(node_name):
	print(node_name.type)
	if (node_name.type == 'bps'):
		increment_bps(node_name.value)
	elif (node_name.type == 'bpc'):
		increment_bpc(node_name.value)
		
	increment_bananas(-node_name.price)
	node_name.nb_owned += 1
	node_name.price *= node_name.price_multiplier

func disable_expensive_clickers():
	for c in %ClickerSection.get_children():
		c.disabled = bananas < c.price

func _on_button_autoclicker_pressed():
	buy_clicker(%ButtonAutoclicker)

func _on_button_bananier_pressed():
	buy_clicker(%ButtonBananier)

func _on_button_super_curseur_pressed():
	buy_clicker(%ButtonSuperCurseur)

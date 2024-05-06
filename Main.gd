extends Node2D

#################### Variables
var bananas: float = 0:
	set(new_val):
		bananas = new_val
		%LabelBananas.value = bananas
	get:
		return bananas

var bps: float = 1:
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
	pass

func _process(delta):
	increment_via_bps(delta)


#################### Custom functions
func increment_bananas(amount: float):
	bananas = bananas + amount

func increment_via_bps(delta: float):
	increment_bananas(bps * delta)

func increment_via_bpc():
	increment_bananas(bpc)

func _on_button_main_pressed():
	increment_via_bpc()

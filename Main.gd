extends Node2D

@onready var main_grid := $MainGrid
@onready var grid_buttons := $MainGrid/GridButtons
@onready var grid_labels := $MainGrid/GridLabels
@onready var main_button := $MainGrid/GridContainer/ButtonMain
@onready var label_bananas := $MainGrid/GridLabels/LabelBananas
@onready var label_bps := $MainGrid/GridLabels/LabelBps
@onready var label_bpc := $MainGrid/GridLabels/LabelBpc
@onready var score_timer := $ScoreTimer

var update_interval = 0.1

var bananas = 0
var bps = 1
var bpc = 1

# Called when the node enters the scene tree for the first time.
func _ready():


	_start_auto_increment()
	_update_text()

	main_button.pressed.connect(self._increment_via_bpc)
	
	label_bananas.show()
	label_bps.text = 'Bananes par seconde : ' + str(bps)
	label_bpc.text = 'Bananes par clic : ' + str(bpc)
	label_bps.show()
	label_bpc.show()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass

func _increment_bananas(amount):
	bananas = bananas + amount
	_update_text()

func _increment_via_bps():
	_increment_bananas(bps * update_interval)
	
func _increment_via_bpc():
	_increment_bananas(bpc)

func _update_text():
	var text = 'Bananes : ' + str(snapped(bananas, 1))
	label_bananas.text = text

func _start_auto_increment():
	score_timer.wait_time = update_interval
	score_timer.start()
	score_timer.connect("timeout", _increment_via_bps)



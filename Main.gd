extends Node2D

var update_interval = 0.05

var bananas = 0
var bps = 1
var bpc = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	_start_auto_increment()
	_update_text()
	$ButtonMain.text = 'Clique'
	$ButtonMain.pressed.connect(self._increment_via_bpc)
	$ButtonMain.show()
	
	$LabelBananas.show()
	$LabelBps.text = 'Bananes par seconde : ' + str(bps)
	$LabelBpc.text = 'Bananes par clic : ' + str(bpc)
	$LabelBps.show()
	$LabelBpc.show()
	

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
	$LabelBananas.text = text

func _start_auto_increment():
	$ScoreTimer.wait_time = update_interval
	$ScoreTimer.start()
	$ScoreTimer.connect("timeout", _increment_via_bps)



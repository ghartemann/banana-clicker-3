extends Node2D

var bananas = 0
var bps = 1235
var bpc = 10

func _ready():
	%ButtonMain.pressed.connect(self.increment_via_bpc)
	
	update_text()
	%LabelBananas.show()
	%LabelBps.show()
	%LabelBpc.show()

func _process(delta):
	increment_via_bps(delta)

func increment_bananas(amount: float):
	bananas = bananas + amount
	update_text()

func increment_via_bps(delta: float):
	increment_bananas(bps * delta)

func increment_via_bpc():
	increment_bananas(bpc)

func update_text():
	%LabelBananas.text = 'Bananes : ' + str(snapped(bananas, 1))
	%LabelBps.text = 'Bananes par seconde : ' + str(bps)
	%LabelBpc.text = 'Bananes par clic : ' + str(bpc)

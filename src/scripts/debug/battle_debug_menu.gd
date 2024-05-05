extends BoxContainer

@onready var turn_label = $VBoxContainer/TurnDebug
@onready var round_label = $VBoxContainer/RoundDebug
@onready var root = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if root.turn:
		turn_label.text = "turn: %s" % str(root.turn)
	else:
		turn_label.text = "no turn"
	
	if root.round:
		round_label.text = "round: %s" % str(root.round)
	else:
		round_label.text = "no round"


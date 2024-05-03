extends BoxContainer

@onready var turn_label = $VBoxContainer/TurnDebug
@onready var root = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if root.turn:
		turn_label.text = "turn: %s" % str(root.turn)
	else:
		turn_label.text = "no turn"

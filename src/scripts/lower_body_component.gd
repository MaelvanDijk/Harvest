extends Node2D
class_name LowerBodyComponent

var actions := {
	"attack" : {"Lower body weak attack": 5, "Lower body medium attack": 10, "Lower body heavy attack": 15},
	"overdrive" : {"lower body" : 50},
	"repair" : {"lower body" : 20},
	"stats": {"lower body": 100}
}

var max_health := 100
var current_health := max_health

func get_sub_actions(action_type):
	return actions[action_type]

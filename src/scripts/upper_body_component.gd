extends Node2D
class_name UpperBodyComponent

var actions := {
	"attack" : {"Upper body weak attack": 5, "Upper body medium attack": 10, "Upper body heavy attack": 15},
	"overdrive" : {"upper body" : 50},
	"repair" : {"upper body" : 20},
	"stats": {"upper body": 100}
}

var max_health := 100
var current_health := max_health

func get_sub_actions(action_type):
	return actions[action_type]

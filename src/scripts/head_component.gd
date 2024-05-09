extends Node2D
class_name HeadComponent

var actions := {
	"attack" : {"Head weak attack": 5, "Head medium attack": 10, "Head heavy attack": 15},
	"overdrive" : {"head" : 50},
	"repair" : {"head" : 20},
	"stats": {"head": 100}
}

var max_health := 100
var current_health := max_health

func get_sub_actions(action_type):
	return actions[action_type]

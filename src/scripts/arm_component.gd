extends Node2D
class_name ArmComponent

#TODO: Future collection for attacks
#@export var attack_resource:Resource

@export var arm_type:ARM_TYPES

enum ARM_TYPES {RIGHT_ARM, LEFT_ARM}

var actions := {
	"attack" : {"weak attack": 115, "medium attack": 210, "heavy attack": 315},
	"overdrive" : {"right arm" : 50},
	"repair" : {"right arm" : 20},
	"stats": {"right arm": 100}
}

var arm_name : String
var max_health := 100
var current_health := max_health

func get_sub_actions(action_type):
	var sub_actions
	
	if arm_type == ARM_TYPES.RIGHT_ARM:
		arm_name = "Right arm"
	elif arm_type == ARM_TYPES.LEFT_ARM:
		arm_name == "Left arm"
	
	sub_actions = _fix_sub_action_names(actions[action_type])
	return sub_actions

#TODO: Should be temporary until unique attack names exist
func _fix_sub_action_names(sub_actions:Dictionary):
	var new_sub_action_name: String
	var fixed_sub_actions : Dictionary
	
	for action in sub_actions:
		new_sub_action_name = arm_name + " " + action
		fixed_sub_actions[new_sub_action_name] = sub_actions[action]
		
	return fixed_sub_actions
	

extends Node2D
class_name MechBodyComponent

@export var head_component:HeadComponent
@export var upper_body_component:UpperBodyComponent
@export var right_arm_component:ArmComponent
@export var left_arm_component:ArmComponent
@export var lower_body_component:LowerBodyComponent

@onready var body_parts := [head_component, upper_body_component, right_arm_component, left_arm_component, lower_body_component]

func get_sub_actions(action_type):
	var sub_action_dict:= {}
	
	for body_part in body_parts:
		var body_part_sub_actions_dict = body_part.get_sub_actions(action_type)
		sub_action_dict.merge(body_part_sub_actions_dict)
		
	return sub_action_dict
		

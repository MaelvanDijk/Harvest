extends Node2D

@onready var target_sprite := $TargetSprite

var ally_group := Array()
var enemy_group := Array()
var target_array := Array()


func _ready():
	_get_groups()
	_get_targets()

func _get_groups():
	var ally_group_name = get_parent().get_parent().name
	ally_group = get_parent().get_parent().get_children()
	
	if ally_group_name == "PlayerGroup":
		enemy_group = get_parent().get_parent().get_parent().get_node("EnemyGroup").get_children()
	else:
		enemy_group = get_parent().get_parent().get_parent().get_node("PlayerGroup").get_children()

func _get_targets():
	target_array = enemy_group.duplicate()
	
	target_sprite.global_position =  target_array[0].global_position
	target_sprite.visible = true

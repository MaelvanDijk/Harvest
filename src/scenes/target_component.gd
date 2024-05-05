extends Node2D

@onready var target_sprite := $TargetSprite

var ally_array := Array()
var enemy_array := Array()


var active_target: Node2D
var old_target_idx := 0


func _ready():
	_get_targets()
	
func _input(_delta):
	if Input.is_key_pressed(KEY_DOWN):
		_change_target(-1)
	elif Input.is_key_pressed(KEY_UP):
		_change_target(1)

func _get_groups():
	var ally_group_name = get_parent().get_parent().name
	ally_array = get_parent().get_parent().get_children()
	
	if ally_group_name == "PlayerGroup":
		enemy_array = get_tree().current_scene.get_node("EnemyGroup").get_children()
	else:
		enemy_array = get_tree().current_scene.get_node("EnemyGroup").get_children()

func _get_targets():
	_get_groups()
	var target_array = enemy_array.duplicate()
	active_target = target_array[old_target_idx]
	_change_target_sprite_location()
	
func _change_target(sign:int):
	var new_target_idx = old_target_idx + 1 * sign
	active_target = enemy_array[new_target_idx]
	print("active target")
	_change_target_sprite_location()
	
	old_target_idx = new_target_idx
	
func _change_target_sprite_location():
	target_sprite.global_position =  active_target.global_position - Vector2(200,0)
	target_sprite.visible = true
	
func get_selected_target():
	return active_target

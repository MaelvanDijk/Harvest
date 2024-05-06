extends Node2D

@onready var target_sprite := $TargetSprite

var ally_array := Array()
var enemy_array := Array()
var target_groups_array :Array[Array]
var target_array := Array()

var active_target: Node2D
var unit_target_idx := 0
var group_target_idx := 1

signal target_selected(target:Node2D)

func _ready():
	_get_targets()
	
func _input(_delta):
	if Input.is_key_pressed(KEY_DOWN):
		_change_target(-1)
	elif Input.is_key_pressed(KEY_UP):
		_change_target(1)
	elif Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_RIGHT):
		_change_target_group()
	elif Input.is_key_pressed(KEY_ENTER):
		target_selected.emit(active_target)

func _get_groups():
	var ally_group_name = get_parent().get_parent().name
	ally_array = get_parent().get_parent().get_children()
	
	if ally_group_name == "PlayerGroup":
		enemy_array = get_tree().current_scene.get_node("EnemyGroup").get_children()
	else:
		enemy_array = get_tree().current_scene.get_node("PlayerGroup").get_children()
	target_groups_array = [ally_array, enemy_array]
	
func _get_targets():
	_get_groups()
	target_array = target_groups_array[group_target_idx].duplicate()
	
	active_target = target_array[unit_target_idx]
	_change_target_sprite_location()
	
func _change_target(sign:int):
	var new_target_idx = unit_target_idx + 1 * sign
	var max_idx = len(target_array) - 1
	
	if new_target_idx > max_idx:
		new_target_idx = 0
	elif new_target_idx < 0:
		new_target_idx = max_idx
	elif new_target_idx == 0:
		new_target_idx = 0
	
	active_target = target_array[new_target_idx]
	_change_target_sprite_location()
	
	unit_target_idx = new_target_idx

func _change_target_group():
	if group_target_idx == 0:
		group_target_idx = 1
	else:
		group_target_idx = 0
		
	target_array = target_groups_array[group_target_idx].duplicate()
	_change_target(0)

func _change_target_sprite_location():
	target_sprite.global_position =  active_target.global_position - Vector2(200,0)
	target_sprite.visible = true
	
func get_selected_target():
	return active_target

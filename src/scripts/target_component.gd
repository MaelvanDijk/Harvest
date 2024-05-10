extends Node2D

@onready var target_sprite := $TargetSprite

var ally_array := Array()
var enemy_array := Array()
var target_groups_array :Array[Array]
var target_array := Array()

var active_target: Node2D
var unit_target_idx := 0
var group_target_idx := 1
var is_active = false

signal target_selected(target:Node2D)
signal selection_canceled

func make_active():
	self.is_active = true
	self.visible = true
	_get_targets()

func _make_inactive():
	self.is_active = false
	self.visible = false

	
func _input(event):
	if is_active:
		if event.is_action_pressed("ui_down"):
			_change_target(-1)
		elif event.is_action_pressed("ui_up"):
			_change_target(1)
		elif event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
			_change_target_group()
		elif event.is_action_pressed("ui_accept"):
			target_selected.emit(active_target)
			_make_inactive()
		elif event.is_action_pressed("ui_cancel"):
			unit_target_idx = 0
			group_target_idx = 1
			selection_canceled.emit()
			_make_inactive()

func _get_groups():
	var ally_group_name = get_parent().get_parent().get_parent().name
	ally_array = get_parent().get_parent().get_parent().get_children()
	
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

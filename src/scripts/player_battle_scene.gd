extends Node
class_name PlayerBattleCharacter

@export var health_component: HealthComponent
@export var righ_arm_component: ArmComponent
@export var speed:int

@onready var turn_sprite := $TurnSprite
@onready var battle_menu := $BattleMenu
@onready var mech_body_component := $MechBodyComponent

var is_turn_active = false

signal deal_total_damage(amount)
signal player_turn_ended

func play_turn():
	print("playing turn")
	_make_active()
	_play_start_phase()
	_play_main_phase()
	_play_cleanup_phase()

func _make_active():
	"""Handles activation of components to allow actions and visual queues."""
	is_turn_active = true
	turn_sprite.visible = true
	


func make_inactive():
	is_turn_active = false
	turn_sprite.visible = false

func _play_start_phase():
	print("start phase")

func _play_main_phase():	battle_menu.visible = true

func _play_cleanup_phase():
	print("end phase")

func _on_right_arm_component_deal_damage(amount):
	deal_total_damage.emit(amount)

func _on_health_component_health_depleted():
	self.queue_free()

func _on_battle_menu_turn_ended():
	player_turn_ended.emit()


func _on_battle_menu_sub_actions_requested(action_type):
	var sub_actions = mech_body_component.get_sub_actions(action_type)
	print(sub_actions)
	return battle_menu.generate_action_buttons(sub_actions)

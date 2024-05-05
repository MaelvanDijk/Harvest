extends Node
class_name PlayerBattleCharacter

@export var health_component: HealthComponent
@export var righ_arm_component: RightArmComponent
@export var speed:int

@onready var turn_sprite := $TurnSprite


var is_turn_active = false

signal deal_total_damage(amount)
signal turn_ended

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
	

func _play_start_phase():
	print("start phase")


func _play_main_phase():
	print("main phase")


func _play_cleanup_phase():
	print("end phase")

func _on_right_arm_component_deal_damage(amount):
	deal_total_damage.emit(amount)
	
func _on_end_turn_button_pressed():
	turn_ended.emit()

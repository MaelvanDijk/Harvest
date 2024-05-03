extends Node
class_name PlayerBattleCharacter

@export var health_component: HealthComponent
@export var righ_arm_component: RightArmComponent
@export var speed:int

signal deal_total_damage(amount)

func play_turn():
	print("playing turn")

	_play_start_phase()
	_play_main_phase()
	_play_cleanup_phase()

func _play_start_phase():
	print("start phase")
	
func _play_main_phase():
	print("main phase")

func _play_cleanup_phase():
	print("end phase")


func _on_right_arm_component_deal_damage(amount):
	deal_total_damage.emit(amount)

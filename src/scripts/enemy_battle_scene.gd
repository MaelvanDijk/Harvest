extends Node
class_name EnemyBattleCharacter

@export var health_component: HealthComponent
@export var attack := 10
@export var speed:int

signal attack_player(damage)
signal turn_ended
signal combatant_destroyed
	
func _attack():
	print("enemy attacking!")
	attack_player.emit(attack)
	
func play_turn():
	print("playing turn")

	_play_start_phase()
	_play_main_phase()
	_play_cleanup_phase()
	turn_ended.emit()


func _play_start_phase():
	print("start phase")


func _play_main_phase():
	print("main phase")


func _play_cleanup_phase():
	print("end phase")

func _on_health_component_health_depleted():
	combatant_destroyed.emit()
	self.queue_free()

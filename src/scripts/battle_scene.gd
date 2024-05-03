extends Node2D

@onready var player := $PlayerBattleScene
@onready var enemy := $EnemyBattleScene

@onready var combatants := [player, enemy]
@onready var start_button = $MainBattleMenu/StartButton

var sorted_turn_order := Array()
var turn = "none"
var round := 0


func _combat_loop():
	print("Starting combat")
	_decide_turn_order()
	_apply_round_start_effects()
	
	#for combatant in sorted_turn_order:
		#turn = combatant
		#combatant.play_turn()
		
func _decide_turn_order():
	print("deciding turn order")
	var unsorted_turn_order := combatants
	
	unsorted_turn_order.sort_custom(sort_descending)
	sorted_turn_order = unsorted_turn_order

func sort_descending(a, b):
	"""Sorts custom sort array in descending order"""
	if a.speed > b.speed:
		return true
	return false
	
func _apply_round_start_effects():
	print("Applying round start effects")


#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
#
#func play_turn():
	#"""Handles play turn management"""
	#match turn:
		#turn_order.PLAYER:
			#pass
		#turn_order.ENEMY:
			#_end_turn()
#
#func _end_turn():
	#"""Handles end turn management"""
	#match turn:
		#turn_order.PLAYER:
			#turn = turn_order.ENEMY
		#turn_order.ENEMY:
			#turn = turn_order.PLAYER
#
#func _on_attack_button_pressed():
	#"""Handles the attack button signal to spend resources and deal damage"""
	#enemy.health_component.damage(10)
	#_end_turn()
#
func _on_enemy_attack(damage):
	print("damage")
	player.health_component.damage(damage)


func _on_start_button_pressed():
	start_button.queue_free()
	_combat_loop()
	
	


func _on_player_battle_scene_deal_total_damage(amount):
	print(amount)
	enemy.health_component.damage(amount)

extends Node2D

enum turn_order {PLAYER, ENEMY}
var turn = turn_order.PLAYER

@onready var enemy_battle_scene = $EnemyBattleScene
@onready var enemy = $EnemyBattleScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _end_turn():
	"""Handles turn management"""
	match turn:
		turn_order.PLAYER:
			print("Switching to enemy turn")
			turn = turn_order.ENEMY
			_play_enemy_turn()
		turn_order.ENEMY:
			print("Switching to player turn")
			turn = turn_order.PLAYER 
			
func _play_enemy_turn():
	enemy.play_turn()

func _on_attack_button_pressed():
	"""Handles the attack button signal to spend resources and deal damage"""
	print("attack!")
	enemy_battle_scene._receive_damage(10)
	_end_turn()

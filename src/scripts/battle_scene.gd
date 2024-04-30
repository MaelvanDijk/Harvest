extends Node2D

@onready var EnemyBattleScene = $EnemyBattleScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_button_pressed():
	"""Handles the attack button signal to spend resources and deal damage"""
	print("attack!")
	EnemyBattleScene._receive_damage(10)

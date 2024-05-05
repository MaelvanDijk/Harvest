extends Node2D

@onready var player_group := $PlayerGroup
@onready var enemy_group := $EnemyGroup
@onready var turn_manager := $TurnManager
@onready var menu_controler := $MenuControler

@onready var combatants := player_group.get_children() + enemy_group.get_children()

var turn = "none"
var round := 0
var combat_active := false

func _ready():
	for player in player_group.get_children():
		player.player_turn_ended.connect(_on_player_turn_ended)
	_play_combat_round()

func _play_combat_round():
	print("Starting combat round")
	round += 1

	if round > 10:
		_end_combat()
	else:
		_apply_round_start_effects()
		turn_manager.play(combatants.duplicate())

func _start_next_round():
	print("Starting next round.")
	_play_combat_round()


func _end_combat():
	print("Ending combat")

func _apply_round_start_effects():
	print("Applying round start effects")

func _on_enemy_attack(damage):
	print("damage")
	#player.health_component.damage(damage)

func _on_player_battle_scene_deal_total_damage(amount):
	print(amount)
	#enemy.health_component.damage(amount)

func _on_turn_manager_round_ended():
	_start_next_round()

func _on_enemy_battle_scene_turn_ended():
	turn_manager.end_turn()

func _on_enemy_battle_scene_combatant_destroyed():
	if len(combatants) <= 1:
		print("You win")

func _on_player_turn_ended():
	turn_manager.end_turn()

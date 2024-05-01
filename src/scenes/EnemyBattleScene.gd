extends Node

@onready var health_bar = $HealthComponent/BoxContainer/healthBar
@export var attack := 10

signal attack_player(damage)

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_player.connect(_deal_damage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func play_turn():
	_deal_damage()
	
func _receive_damage(amount:int):
	"""Handles all damage calls"""
	health_bar.value -= amount
	
func _deal_damage():
	print("enemy attacking!")
	attack_player.emit(attack)
	

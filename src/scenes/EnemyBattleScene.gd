extends Node

@onready var health_bar = $HealthComponent/BoxContainer/healthBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _receive_damage(amount:int):
	"""Handles all damage calls"""
	health_bar.value -= amount
	

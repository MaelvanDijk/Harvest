extends Node2D
class_name HealthComponent

@onready var health_bar = $BoxContainer/HealthBar

signal health_depleted

func damage(value:int):
	"""Handles all damage calls"""
	health_bar.value -= value
	
	if health_bar.value <= 0:
		health_depleted.emit()

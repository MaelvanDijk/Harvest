extends Node2D
class_name HealthComponent

@onready var health_bar = $BoxContainer/HealthBar

@export var max_health := 1000:
	set(val):
		pass
	get:
		return max_health

var current_health := max_health


signal health_depleted


func damage(value:int):	
	"""Handles all damage calls"""
	var change_health_bar_amount
	
	change_health_bar_amount = value / max_health * 100
	_change_health_bar(change_health_bar_amount)
	
	if current_health <= 0:
		health_depleted.emit()
	

func _change_health_bar(amount:float):
	health_bar.value -= amount
	
	

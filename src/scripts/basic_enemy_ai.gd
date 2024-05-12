extends Node

@export var unit_class:UNIT_CLASS_TYPES

@onready var health_component := $"../HealthComponent"

# TODO: Maybe derive from mechbody
enum UNIT_CLASS_TYPES {
	SOLDIER, # Balanced
	BERSEKER, # Always attacks
	MEDIC # Heals more and others
}

func make_active():
	_choose_strategy()

func _choose_strategy():
	health_component.current_health


func _normal_attack():
	pass

func _repair_self():
	pass


func _repair_other():
	pass


func _use_overdrive():
	pass

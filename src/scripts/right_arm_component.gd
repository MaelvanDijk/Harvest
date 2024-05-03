extends Node2D
class_name RightArmComponent

@onready var menu_button:TextureButton = $MenuButton
@onready var container_control:Control = $ContainerControl

@export var attack:int

signal deal_damage(amount:int)

func _on_texture_button_pressed():
	if container_control.visible:
		container_control.visible = false 
	else:
		container_control.visible = true


func _on_attack_button_pressed():
	print("Right arm attack!")
	deal_damage.emit(attack)

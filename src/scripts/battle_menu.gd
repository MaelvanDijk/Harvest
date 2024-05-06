extends Control

var attack_actions := [
	"Attack 1", " Attack 2", "Attack 3", "Attack 4", "Attack 5",
	"Attack 6", " Attack 7", "Attack 8", "Attack 9", "Attack 10",
	"Attack 11", " Attack 12", "Attack 13", "Attack 14", "Attack 15",
]
var bodypart_actions := ["Right Arm", "Left Arm", "Head", "Torso", "Legs"]
var max_horizontal_buttons := 5
var last_selected_main_option : String

@onready var action_columns_container := $Panel/VBoxContainer/SecondaryChoiceContainer/ActionColumnsContainer
@onready var action_columns_array := action_columns_container.get_children()

signal turn_ended

func _generate_action_buttons(actions:Array):
	_clear_previous_buttons()
	for action in actions:
		var new_action_button = Button.new()
		new_action_button.text = action
		
		for action_column in action_columns_array:
			if action_column.get_child_count() >= max_horizontal_buttons:
				pass
			else:
				action_column.add_child(new_action_button)

func _clear_previous_buttons():
	for action_column in action_columns_array:
		if action_column.get_child_count() >= 1:
			for button in action_column.get_children():
				action_column.remove_child(button)
				button.queue_free()


func _on_attack_button_pressed():
	var option_name = "attack"
	if last_selected_main_option == option_name:
		pass
	else:
		print("requesting available attack actions")
		last_selected_main_option = option_name
		_generate_action_buttons(attack_actions)
		


func _on_overdrive_button_pressed():
	var option_name = "overdrive"
	if last_selected_main_option == option_name:
		pass
	else:
		print("requesting available overdrive actions")
		last_selected_main_option = option_name
		_generate_action_buttons(bodypart_actions)


func _on_stats_button_pressed():
	var option_name = "stats"
	if last_selected_main_option == option_name:
		pass
	else:
		print("requesting available stats")
		last_selected_main_option = option_name
		_generate_action_buttons(bodypart_actions)


func _on_repair_button_pressed():
	var option_name = "overdrive"
	if last_selected_main_option == option_name:
		pass
	else:
		print("requesting available repair actions")
		last_selected_main_option = option_name
		_generate_action_buttons(bodypart_actions)


func _on_end_turn_pressed():
	turn_ended.emit()
	self.hide()

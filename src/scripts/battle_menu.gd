extends Control

var actions := {
	"attack": {
		"Attack 1":10, " Attack 2":10, "Attack 3":10, "Attack 4":10, "Attack 5":10,
		"Attack 6":10, " Attack 7":10, "Attack 8":10, "Attack 9":10, "Attack 10":10,
		"Attack 11":50, " Attack 12":50, "Attack 13":40, "Attack 14":30, "Attack 15":20,
		},
	"repair": {"Right Arm": 10, "Left Arm":10, "Head":10, "Torso":10, "Legs":10},		
	"overdrive": {"Right Arm": 10, "Left Arm":10, "Head":10, "Torso":10, "Legs":10},
	"status": {"Right Arm": 10, "Left Arm":10, "Head":10, "Torso":10, "Legs":10}
	}

var max_horizontal_buttons := 5
var last_selected_main_option : String

@onready var action_columns_container := $Panel/VBoxContainer/SecondaryChoiceContainer/ActionColumnsContainer
@onready var action_columns_array := action_columns_container.get_children()

signal turn_ended
signal sub_actions_requested(action_type:String)
signal action_selected(action)


func generate_action_buttons(sub_actions:Dictionary):
	_clear_previous_buttons()
	print(sub_actions)
	for action_name in sub_actions:
		var new_action_button = Button.new()
		new_action_button.text = action_name
		new_action_button.pressed.connect(_on_action_button_pressed.bind(sub_actions[action_name]))
		
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
	var action_type = "attack"
	if last_selected_main_option == action_type:
		pass
	else:
		print("requesting available attack actions")
		sub_actions_requested.emit(action_type)
		last_selected_main_option = action_type


func _on_overdrive_button_pressed():
	var action_type = "overdrive"
	if last_selected_main_option == action_type:
		pass
	else:
		print("requesting available overdrive actions")
		sub_actions_requested.emit(action_type)
		last_selected_main_option = action_type


func _on_stats_button_pressed():
	var action_type = "stats"
	if last_selected_main_option == action_type:
		pass
	else:
		print("requesting available stats")
		sub_actions_requested.emit(action_type)
		last_selected_main_option = action_type


func _on_repair_button_pressed():
	var action_type = "overdrive"
	if last_selected_main_option == action_type:
		pass
	else:
		print("requesting available repair actions")
		sub_actions_requested.emit(action_type)
		last_selected_main_option = action_type


func _on_end_turn_pressed():
	_clear_previous_buttons()
	last_selected_main_option = ""	
	self.hide()
	turn_ended.emit()
	
func _on_action_button_pressed(action_value):
	print(action_value)

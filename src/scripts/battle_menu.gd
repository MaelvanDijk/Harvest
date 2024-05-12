extends Control
class_name BattleMenu

var is_active := false
var max_horizontal_buttons := 5
var last_selected_main_option : String
var selected_action

@onready var target_selector = $TargetSelector
@onready var battle_menu_panel = $BattleMenuPanel
@onready var action_columns_container := $BattleMenuPanel/VBoxContainer/SecondaryChoiceContainer/ActionColumnsContainer
@onready var action_columns_array := action_columns_container.get_children()

signal sub_actions_requested(action_type:String)
signal action_and_target_selected(selected_action, target)


func make_active():
	print("ACTIVATE")
	is_active = true
	battle_menu_panel.visible = true
	#_disable_or_enable_child_nodes(battle_menu_panel, false)

func _make_inactive():
	_clear_previous_buttons()
	last_selected_main_option = ""
	is_active = false

	#_disable_or_enable_child_nodes(battle_menu_panel, true)

func generate_action_buttons(sub_actions:Dictionary):
	print("generatign")
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
	
func _on_action_button_pressed(action_value):
	#_disable_or_enable_child_nodes(battle_menu_panel, true)
	target_selector.make_active()
	selected_action = action_value

func _on_target_selector_selection_canceled():
	pass
	#_disable_or_enable_child_nodes(battle_menu_panel, false)

func _on_target_selector_target_selected(target):
	action_and_target_selected.emit(selected_action, target)
	_make_inactive()

#func _disable_or_enable_child_nodes(node:Node, disable:bool):
	#var focus = FOCUS_NONE if disable else FOCUS_ALL
	#if "disabled" in node:
		#node.disabled = disable
	#if "focus_mode" in node:
		#node.focus_mode = FOCUS_NONE
	#for child in node.get_children():
		#_disable_or_enable_child_nodes(child, disable)





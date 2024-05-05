extends Node

var sorted_combatants := Array()
var combatant

signal round_ended

func play(combatants):
	"""handles turn playing loop"""
	sorted_combatants = _decide_turn_order(combatants)
	_play_turns(sorted_combatants)


func _decide_turn_order(combatants:Array):
	print("deciding turn order")
	var sorted_turn_order := Array()
	var unsorted_turn_order := combatants
	
	unsorted_turn_order.sort_custom(_sort_descending)
	sorted_turn_order = unsorted_turn_order
	
	return sorted_turn_order


func _play_turns(sorted_combatants:Array):
	"Handles actual turn plays"
	if len(sorted_combatants) == 0:
		round_ended.emit()
	else:
		combatant = sorted_combatants.pop_front()
		combatant.play_turn()


func _sort_descending(a, b):
	"""Sorts custom sort array in descending order"""
	if a.speed > b.speed:
		return true
	return false

func end_turn():
	"""Handles end turn management"""
	print("Ending turn")
	_start_next_turn()

func _start_next_turn():
	_play_turns(sorted_combatants)

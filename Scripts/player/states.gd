class_name PlayerStates
extends Node

@export var player : CharacterBody3D
@export var combat : PlayerCombat

var moves : Dictionary

func accept_moves():
		for child in get_children():
			if child is Move:
				moves[child.move_name] = child
				child.player = player
				child.combat = combat
				child.assign_combos()

func moves_priority_sort(a : String, b : String):
	if moves[a].priority > moves[b].priority:
		return true
	else:
		return false
		
func get_move_by_name(move_name : String) -> Move:
	return moves[move_name]

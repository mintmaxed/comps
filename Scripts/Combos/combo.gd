class_name PlayerCombo
extends Node

@onready var move : Move
@onready var triggered_move : String

func is_triggered(_input : InputPackage) -> bool:
	return false

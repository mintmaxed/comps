class_name Move
extends Node

# flags, variables
var player : CharacterBody3D
var combat : PlayerCombat
# var animator : 

var animation : String
var move_name : String
@export var tracking_angular_speed : float = 10
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var combos : Array[PlayerCombo]

var enter_state_time : float
var initial_position : Vector3
var frame_length = 0.016

var has_queued_move : bool = false
var queued_move : String = "error: nonexistent queued move"

var has_forced_move : bool = false
var forced_move : String = "error: nonexistent forced move"

var DURATION : float

static var moves_priority : Dictionary = {
	# hardcoded order of priority for controller to determine what state to apply at any given point
	# for any given input, or lack thereof
	# higher # higher priority
	"idle": 1,
	"run": 2,
	"sprint": 3,
	"jump": 10
}

static func moves_priority_sort(a : String, b : String):
	if moves_priority[a] > moves_priority[b]:
		return true
	else:
		return false

func check_relevance(input : InputPackage) -> String:
	print_debug("error, implement check_relevance")
	return "error, implement check_relevance"
	
func check_combos(input : InputPackage):
	for combo : PlayerCombo in combos:
		pass
		# if combo triggered
			# has_queued_move = true
			# queued_move = combo.triggered_move
			
func _update(input : InputPackage, delta : float):
	if tracks_input_vector():
		process_input_vector(input,delta)
	update(input,delta)
	
func update(input : InputPackage, delta : float):
	pass
	
func process_input_vector(input : InputPackage, delta : float):
	var input_direction = (player.basis * Vector3(-input.input_direction.x, 0, -input.input_direction.y)).normalized()
	var face_direction = player.basis.z
	var angle = face_direction.signed_angle_to(input_direction, Vector3.UP)
	player.rotate_y(clamp(angle, -tracking_angular_speed * delta, tracking_angular_speed * delta))
	
func tracks_input_vector() -> bool:
	# return moves_data_repo.tracks_input_vector(backend_animation, getprogress())
	return true

func assign_combos():
	for child in get_children():
		if child is PlayerCombo:
			combos.append(child)
			child.move = self
	
func on_enter_state():
	pass
	
func on_exit_state():
	pass

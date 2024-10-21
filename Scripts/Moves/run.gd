class_name Run
extends  Move

@export var SPEED = 4.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	animation = "Running_A"

func check_relevance(input : InputPackage):
	if ! player.is_on_floor():
		# return "midair"
		pass
	
	input.actions.sort_custom(moves_priority_sort)
	if input.actions[0] == "run":
		return "okay"
	return input.actions[0]
	
func update(input : InputPackage, delta : float):
	player.velocity = velocity_by_input(input, delta)
	player.look_at(player.global_position - player.velocity)
	player.move_and_slide()
	
func velocity_by_input(input : InputPackage, delta : float) -> Vector3:
	# the arrow specifies return type
	var new_velocity = player.velocity
	
	var direction = (player.transform.basis * Vector3(input.input_direction.x, 0, input.input_direction.y)).normalized()
	new_velocity.x = direction.x * SPEED
	new_velocity.z = direction.z * SPEED
	
	if !player.is_on_floor():
		new_velocity.y -= gravity * delta
	
	return new_velocity
	

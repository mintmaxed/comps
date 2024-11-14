class_name Run
extends Move

<<<<<<< Updated upstream
@export var SPEED = 4.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
=======
@export var SPEED = 6.0
@export var TURN_SPEED = 3.0

@export var FRICTION = 0.5 # would need to implement momentum
@export var REBOUND = 0.2 # ?? maybe??	
>>>>>>> Stashed changes

func _ready():
	animation = "Running_A"

func check_relevance(input : InputPackage):
	input.actions.sort_custom(moves_priority_sort)
	if input.actions[0] == "run":
		return "okay"
	return input.actions[0]
	
func update(input : InputPackage, delta : float):
<<<<<<< Updated upstream
	player.velocity = velocity_by_input(input, delta)
	player.look_at(player.global_position - player.velocity)
	player.move_and_slide()
	
func velocity_by_input(input : InputPackage, delta : float) -> Vector3:
	# the arrow specifies return type
	var new_velocity = player.velocity
=======
	process_input_vector(input, delta)
	player.move_and_slide()
	
func process_input_vector(input : InputPackage, delta : float):
	var input_direction = Vector3(input.input_direction.x, 0, input.input_direction.y).normalized()
	var face_direction = player.basis.z
	var angle = face_direction.signed_angle_to(input_direction, Vector3.UP)
	if abs(angle) >= tracking_angular_speed * delta:
		player.velocity = face_direction.rotated(Vector3.UP, sign(angle) * tracking_angular_speed * delta) * TURN_SPEED
		player.rotate_y(sign(angle) * tracking_angular_speed * delta)
	else:
		player.velocity = face_direction.rotated(Vector3.UP, angle) * SPEED
		player.rotate_y(angle)
	# animator.set_speed_scale(player.velocity.length() / SPEED)
>>>>>>> Stashed changes
	
	var direction = (player.transform.basis * Vector3(input.input_direction.x, 0, input.input_direction.y)).normalized()
	new_velocity.x = direction.x * SPEED
	new_velocity.z = direction.z * SPEED
	
	if !player.is_on_floor():
		new_velocity.y -= gravity * delta
	
	return new_velocity
	

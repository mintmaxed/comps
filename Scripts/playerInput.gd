class_name InputGatherer
extends Node

func gather_input() -> InputPackage:
	var new_input = InputPackage.new()

	new_input.input_direction = Input.get_vector("left", "right", "forward", "backward")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
		# if Input.is_action_pressed("sprint"):
			# new_input.actions.append("sprint")
		
	# input branch examples
	# if Input.is_action_just_pressed("hit"):
		# new_input.actions.append("hit")
		
	if new_input.actions.is_empty():
		new_input.actions.append("idle")

	return new_input

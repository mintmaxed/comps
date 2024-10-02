class_name InputGatherer
extends Node

func gather_input() -> InputPackage:
	var new_input = InputPackage.new()

	if Input.is_action_just_pressed("ui_accept"):
		new_input.actions.append("jump")
		
	# input branch examples
	# if Input.is_action_just_pressed("hit"):
		# new_input.actions.append("hit")
		
	new_input.input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
		
	if new_input.actions.is_empty():
		new_input.actions.append("idle")

	return new_input

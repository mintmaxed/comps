class_name InputGatherer
extends Node

func gather_input() -> InputPackage:
	var new_input = InputPackage.new()
	
	new_input.actions.append("idle")

	new_input.input_direction = Input.get_vector("left", "right", "forward", "backward")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
		if Input.is_action_pressed("sprint"):
			# new_input.actions.append("sprint")
			pass
			
			
	if Input.is_action_just_pressed("hit_1"):
		new_input.combat_actions.append("hit_1")
		
	if Input.is_action_just_pressed("hit_2"):
		new_input.combat_actions.append("hit_2")
		
	if Input.is_action_just_pressed("shield"):
		new_input.combat_actions.append("block")
	
	if Input.is_action_just_pressed("c1"):
		new_input.player = "knight"
	if Input.is_action_just_pressed("c2"):
		new_input.player = "barbarian"


	return new_input

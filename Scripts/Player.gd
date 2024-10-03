extends CharacterBody3D

@onready var input_gatherer = $input as InputGatherer
@onready var model = $model as PlayerModel

func _physics_process(delta):
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	#visuals

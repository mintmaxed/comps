extends CharacterBody3D

@onready var input_gatherer = $input as InputGatherer
@onready var model = $model as PlayerModel
@onready var visuals = $knight_visual as PlayerVisuals

func _ready():
	visuals.accept_skeleton(model.skeleton)
	model.animator.play("Running_B")
	

func _physics_process(delta):
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	#visuals

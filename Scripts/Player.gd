extends CharacterBody3D

@onready var input_gatherer = $input as InputGatherer
@onready var model = $model as PlayerModel
# @onready var visuals = $knight_visual as PlayerVisuals
@onready var enemy = $"../enemy" as EnemyBehavior

func _ready():
	# visuals.accept_skeleton(model.skeleton)
	# visuals.test_skeleton(model.test_skeleton)
	# model.animator.play("Running_B")
	pass
	

func _physics_process(delta):
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	var collision = move_and_collide(velocity * delta, true)
	if collision:
		enemy.enemy_health -= 1
	
	#visuals

extends CharacterBody3D

@onready var input_gatherer = $input as InputGatherer
@onready var model = $model as PlayerModel
# @onready var visuals = $knight_visual as PlayerVisuals
@onready var enemy = $"../enemy" as EnemyBehavior

# @onready var active_avatar : Avatar = $xyz as Knight
# going to toggle between avatars rather than weapons - figure out what needs adjusting

func _ready():
	# visuals.accept_skeleton(model.skeleton)
	# visuals.test_skeleton(model.test_skeleton)
	# model.animator.play("Running_B")
	pass
	
func _physics_process(delta):
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	
	# this is a BAD way to do this!
	var collision = move_and_collide(velocity * delta, true)
	if collision:
		enemy.enemy_health -= 1
		
	input.queue_free()
	
	#visuals

extends CharacterBody3D

# TODO want to include here:
# current weapon/class
# assign skeletons and things

@onready var player = $"."
@onready var input_gatherer = $input as InputGatherer
@onready var model = $Model as PlayerModel

<<<<<<< Updated upstream:Scripts/Player.gd
=======

>>>>>>> Stashed changes:Scripts/player/Player.gd
func _ready():
	pass
	
func _physics_process(delta):
	# called every frame update. main interface with input
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
<<<<<<< Updated upstream:Scripts/Player.gd
	
	# this is a BAD way to do this!
	var collision = move_and_collide(velocity * delta, true)
	if collision:
		enemy.enemy_health -= 1
	
	#visuals
=======
	input.queue_free()
>>>>>>> Stashed changes:Scripts/player/Player.gd

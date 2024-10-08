class_name NewMove
extends Move
# class name to correspond with move type

# redefine parameters and functions to override
func _ready():
	animation = "animation_name"
	
# check relevance (order)
func check_relevance(input : InputPackage):
	pass
	
# update function
func update(input : InputPackage, delta : float):
	pass

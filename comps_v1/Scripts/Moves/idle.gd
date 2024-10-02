class_name Idle
extends Move

func check_relevance(input : InputPackage):
	input.actions.sort_custom(moves_priority_sort)
	return input.actions[0]	


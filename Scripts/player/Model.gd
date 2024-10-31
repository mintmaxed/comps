class_name PlayerModel
extends Node

@onready var player = $".."
@onready var animator = $"../Knight/AnimationPlayer"
@onready var combat = $"../combat" as PlayerCombat
# @onready var skeleton = $Rig/Skeleton3D
@onready var active_class  = {
	"knight" : $"../Knight" as Knight,
	"barbarian" : $"../Barbarian" as Barbarian
}

# var animator
var current_move : Move 
var current_char : PlayerClass
@onready var moves_container = $"../states" as PlayerStates

@onready var moves = {
	"idle" : $"../states/idle",
	"run" : $"../states/run",
	"jump" : $"../states/jump"
}

func _ready():
	current_char = active_class["knight"]
	moves_container.player = player
	moves_container.accept_moves()
	current_move = moves_container["idle"]

func update(input : InputPackage, delta: float):
	if (input.player == "knight"):
		set_player(active_class["knight"])
	else:
		set_player(active_class["barbarian"])
	input = combat.contextualize(input)
	var relevance = current_move.check_relevance(input)
	if relevance != "okay":
		switch_to(relevance)
	current_move._update(input, delta)
	
func switch_to(state : String):
	current_move.on_exit_state()
	current_move = moves_container.moves[state]
	current_move.on_enter_state()
	# current_move.mark_enter_state()
	animator.play(current_move.animation)
	
func set_player(char : PlayerClass):
	current_char.visible = false
	char.visible =  true
	current_char = char	

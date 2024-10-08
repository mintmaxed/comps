extends Node3D
class_name PlayerVisuals

# @onready var model : PlayerModel

@onready var left_arm = $Knight_ArmLeft
@onready var right_arm = $Knight_ArmRight
@onready var body = $Knight_Body
@onready var head = $Knight_Head
@onready var left_leg = $Knight_LegLeft
@onready var right_leg = $Knight_LegRight

@onready var h1_sword_offhand = $"1H_Sword_Offhand"
@onready var badge_shield = $Badge_Shield
@onready var rectangle_shield = $Rectangle_Shield
@onready var round_shield = $Round_Shield
@onready var spike_shield = $Spike_Shield
@onready var h1_sword = $"1H_Sword"
@onready var h2_sword = $"2H_Sword"
@onready var helmet = $Knight_Helmet
@onready var cape = $Knight_Cape 

func accept_skeleton(skeleton : Skeleton3D) :
	left_arm.skeleton = skeleton.get_path()
	right_arm.skeleton = skeleton.get_path()
	body.skeleton = skeleton.get_path()
	head.skeleton = skeleton.get_path()
	left_leg.skeleton = skeleton.get_path()
	right_leg.skeleton = skeleton.get_path()
	
	h1_sword_offhand.skeleton = skeleton.get_path()
	badge_shield.skeleton = skeleton.get_path()
	rectangle_shield.skeleton = skeleton.get_path()
	round_shield.skeleton = skeleton.get_path()
	spike_shield.skeleton = skeleton.get_path()
	h1_sword.skeleton = skeleton.get_path()
	h2_sword.skeleton = skeleton.get_path()
	helmet.skeleton = skeleton.get_path()
	cape.skeleton = skeleton.get_path()

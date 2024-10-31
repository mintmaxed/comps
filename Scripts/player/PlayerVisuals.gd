extends Node3D
class_name PlayerVisuals

# @onready var model : PlayerModel

@onready var left_arm = $body/Knight_ArmLeft
@onready var right_arm = $body/Knight_ArmRight
@onready var body = $body/Knight_Body
@onready var head = $body/Knight_Head
@onready var left_leg = $body/Knight_LegLeft
@onready var right_leg = $body/Knight_LegRight

@onready var h1_sword_offhand = $extras/"1H_Sword_Offhand"
@onready var badge_shield = $extras/Badge_Shield
@onready var rectangle_shield = $extras/Rectangle_Shield
@onready var round_shield = $extras/Round_Shield
@onready var spike_shield = $extras/Spike_Shield
@onready var h1_sword = $extras/"1H_Sword"
@onready var h2_sword = $extras/"2H_Sword"
@onready var helmet = $extras/Knight_Helmet
@onready var cape = $extras/Knight_Cape 

func accept_skeleton(skeleton : Skeleton3D) :
	left_arm.skeleton = skeleton.get_path()
	right_arm.skeleton = skeleton.get_path()
	body.skeleton = skeleton.get_path()
	head.skeleton = skeleton.get_path()
	left_leg.skeleton = skeleton.get_path()
	right_leg.skeleton = skeleton.get_path()
	
func test_skeleton(bone : BoneAttachment3D):
	helmet.skeleton = bone.get_path()
	
	#h1_sword_offhand.skeleton = skeleton.get_path()
	#badge_shield.skeleton = skeleton.get_path()
	#rectangle_shield.skeleton = skeleton.get_path()
	#round_shield.skeleton = skeleton.get_path()
	#spike_shield.skeleton = skeleton.get_path()
	#h1_sword.skeleton = skeleton.get_path()
	#h2_sword.skeleton = skeleton.get_path()
	#helmet.skeleton = skeleton.get_path()
	#cape.skeleton = skeleton.get_path()

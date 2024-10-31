extends Move

@export var RELEASES_PRIORITY : float

var hit_damage = 10 # should be a function of player stats

func update(_input : InputPackage, delta : float):
	move_player(delta)
	# player.model.active_weapon.is_attacking = right_weapon_hurts()
	
func move_player(delta : float):
	# var delta_pos = get_root_position_delta(delta)
	# delta_pos.y = 0
	#  player.velocity = player.get_quaternion() * delta_pos / delta
	if !player.is_on_floor():
		player.velocity.y -= gravity * delta
		has_forced_move = true
		forced_move = "midair"
	player.move_and_slide()

# TODO: fix how this works! you can see what it's trying to do, won't work with our implementation though
#func form_hit_data(weapon : Weapon) -> HitData:
	#var hit = HitData.new()
	#hit.damage = hit_damage
	#hit.hit_move_animation = animation
	#hit.can_block = is_blockable()
	#hit.weapon = player.model.active_weapon
	#return hit
	
func on_exit_state():
	# player.model.active_weapon.hitbox_ignore_list.clear()
	# player.model.active_weapon.is_attacking = false
	pass

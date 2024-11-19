extends Moveset

#run moveset
@export var run_speed = 3.5

func check_relevance(thisInput: InputResource) -> String:
	thisInput.actions.sort_custom(moves_priority_sort)

	return thisInput.actions[0]

func on_enter_state() -> void:
	pass

func on_exit_state() -> void:
	pass

func update(thisInput, delta):
	var velocity = player.velocity
	if !player.is_on_floor():
		velocity.y -= gravity * delta

	var speed = run_speed
	var input_dir = thisInput.input_direction
	var dir = (player.transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	dir = dir.rotated(Vector3.UP, spring_arm.rotation.y)
	if dir:
		velocity.x = lerp(velocity.x, dir.x * speed, LERP_VAL)
		velocity.z = lerp(velocity.z, dir.z * speed, LERP_VAL)
		player_model.rotation.y = lerp_angle(player_model.rotation.y, atan2(-dir.x, -dir.z), LERP_VAL)
	else:
		velocity.x = lerp(velocity.x, 0.0, LERP_VAL)
		velocity.z = lerp(velocity.z, 0.0, LERP_VAL)

	var blend = animation_tree.get("parameters/WalkRun/blend_amount")
	blend = lerp(blend, 1.0, LERP_VAL)
	animation_tree.set("parameters/WalkRun/blend_amount", blend)
	animation_tree.set("parameters/WalkIdle/blend_amount", velocity.length() / speed)
	
	player.velocity = velocity

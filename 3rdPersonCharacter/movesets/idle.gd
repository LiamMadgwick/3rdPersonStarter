extends Moveset

#idle moveset

func check_relevance(thisInput: InputResource) -> String:
	thisInput.actions.sort_custom(moves_priority_sort)
	return thisInput.actions[0]
	
func update(_thisInput, delta) -> void:
	if !player.is_on_floor():
		player.velocity.y -= gravity * delta

	player.velocity.x = lerp(player.velocity.x, 0.0, LERP_VAL)
	player.velocity.z = lerp(player.velocity.z, 0.0, LERP_VAL)

	var blend = animation_tree.get("parameters/WalkIdle/blend_amount")
	blend = lerp(blend, 0.0, LERP_VAL)
	animation_tree.set("parameters/WalkIdle/blend_amount", blend)
	
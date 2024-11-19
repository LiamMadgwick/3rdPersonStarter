extends Node
class_name Moveset

@onready var player : CharacterBody3D = get_tree().get_first_node_in_group("player")
@onready var spring_arm : Node3D = get_parent().spring_arm
@onready var player_model = get_parent().player_model
@onready var animation_tree = get_parent().animation_tree

const LERP_VAL = 0.15
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

static var moveset_priority : Dictionary = {
	"idle" : 1,
	"walk" : 2,
	"run" : 3
}

static func moves_priority_sort(a : String, b : String):
	if moveset_priority[a] > moveset_priority[b]:
		return true
	else:
		return false

func check_relevance(_thisInput : InputResource) -> String:
	print_debug("error, implement check_relvance function in your moveset")
	return ("error, implement check_relvance function in your moveset")

func update(_thisInput, _delta) -> void:
	pass

func on_enter_state() -> void:
	pass

func on_exit_state() -> void:
	pass

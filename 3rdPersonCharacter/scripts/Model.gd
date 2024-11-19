extends Node
class_name PlayerModel

@onready var player = get_parent()
@export var spring_arm : Node
@export var player_model : Node
@export var player_skeleton : Node
@export var animation_tree : Node

var current_moveset : Moveset

@onready var player_movesets : Dictionary

func _ready() -> void:
	player_movesets = {
	"idle" : $Idle, 
	"walk" : $Walk,
	"run" : $Run
	}

	current_moveset = player_movesets["idle"]

func update(thisInput, delta) -> void:
	var relevance = current_moveset.check_relevance(thisInput)
	if relevance != "OK":
		switch_to(relevance)
	
	current_moveset.update(thisInput, delta)
	
func switch_to(state : String) -> void:
	current_moveset.on_exit_state()
	current_moveset = player_movesets[state]
	current_moveset.on_enter_state()

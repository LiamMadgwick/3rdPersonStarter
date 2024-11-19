extends CharacterBody3D

@onready var input = $Input
@onready var model = $Model
@export var character : Node

func _physics_process(delta: float) -> void:
	model.update(input.collect_input(), delta)

	move_and_slide()

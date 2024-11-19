extends Node3D

@export var sensitivity : float = 0.001

@onready var spring_arm : SpringArm3D = $SpringArm3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity)

		spring_arm.rotate_x(-event.relative.y * sensitivity)
		spring_arm.rotation.x = clamp(spring_arm.rotation.x, -(PI/6), -(PI/12))
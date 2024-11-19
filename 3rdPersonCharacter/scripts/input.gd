extends Node
class_name PlayerInput

func collect_input() -> InputResource:
    var new_input = InputResource.new()

    if Input.is_action_pressed("run"):
        new_input.actions.append("run")
    
    if Input.is_action_pressed("aim"):
        new_input.actions.append("aim")
    
    new_input.input_direction = Input.get_vector("left", "right", "forward", "back")

    if new_input.input_direction:
        new_input.actions.append("walk")
    
    
    if new_input.actions.is_empty():
        new_input.actions.append("idle")
    
    return new_input
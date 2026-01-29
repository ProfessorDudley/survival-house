extends CharacterBody3D

@export var move_speed: float = 1000

func _process(_delta: float):
	var _input_vector: Vector3 = Vector3.ZERO # The player's movement vector.
	if Input.is_action_pressed(&"move_right"):
		_input_vector.x += 1
	if Input.is_action_pressed(&"move_left"):
		_input_vector.x -= 1

	if _input_vector != Vector3.ZERO:
		_input_vector = _input_vector.normalized()

	velocity.x = _input_vector.x * move_speed * _delta
	velocity.z = _input_vector.z * move_speed * _delta
	
	move_and_slide()

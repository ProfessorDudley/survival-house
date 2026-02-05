class_name CameraController extends Node

@onready var root: Node3D = get_parent()

@export var _move_speed: float = 1

func _process(_delta: float) -> void:
	# View Movement
	var _input_vector: Vector3 = Vector3.ZERO # The player's movement vector.
	_input_vector.x = Input.get_axis(&"move_left", &"move_right")
	_input_vector.y = Input.get_axis(&"move_down", &"move_up")
		
	# Normalise the _input_vector
	if _input_vector != Vector3.ZERO:
		_input_vector = _input_vector.normalized()
		
	# Apply the _input_vector to the camera
	root.position += _input_vector * _delta * _move_speed

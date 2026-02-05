class_name CameraController extends Node

@onready var root: Node3D = get_parent()
@onready var camera: Camera3D = $"../Camera3D"

@export var _move_speed: float = 1
@export var _zoom_speed: float = 1
@export var _min_zoom_distance: float = 4
@export var _max_zoom_distance: float = 10

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
	
	# View zoom
	var _input_zoom: float = 0.0
	if Input.is_action_pressed(&"zoom_in") && camera.position.z > _min_zoom_distance:
		_input_zoom -= 1
	if Input.is_action_pressed(&"zoom_out") && camera.position.z < _max_zoom_distance:
		_input_zoom += 1
	
	if _input_zoom != 0:
		camera.position.z += _input_zoom * _delta * _zoom_speed

class_name PlayerCharacter extends CharacterBody3D

@export var _move_speed: float = 1000
@export var _zoom_speed: float = 1
@export var _min_zoom_distance: float = 4
@export var _max_zoom_distance: float = 10

@onready var player_stats: PlayerStats = $player_stats

func _process(_delta: float):	
	## Left and Right Movement
	var _input_vector: Vector3 = Vector3.ZERO # The player's movement vector.
	if Input.is_action_pressed(&"move_right"):
		_input_vector.x += 1
	if Input.is_action_pressed(&"move_left"):
		_input_vector.x -= 1

	if _input_vector != Vector3.ZERO:
		_input_vector = _input_vector.normalized()

	velocity.x = _input_vector.x * _move_speed * _delta
	velocity.z = _input_vector.z * _move_speed * _delta
	
	move_and_slide()
	
	## Zoom Movement
	var _input_zoom: float = 0.0
	if Input.is_action_pressed(&"zoom_in") && $Camera3D.position.z > _min_zoom_distance:
		_input_zoom -= 1
	if Input.is_action_pressed(&"zoom_out") && $Camera3D.position.z < _max_zoom_distance:
		_input_zoom += 1
	
	if _input_zoom != 0:
		$Camera3D.position.z += _input_zoom * _zoom_speed * _delta

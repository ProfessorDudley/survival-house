extends Control

@onready var label: Label = $Label
@export var time_format: String = "%02.0f:%02.0f:%02.0f"

func _init() -> void:
	DateTime.timeout.connect(_on_time_update)
	
func _on_time_update() -> void:
	label.text = str(time_format % [DateTime.hours, DateTime.minutes, DateTime.seconds])

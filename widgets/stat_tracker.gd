extends Control

@export var player: PlayerCharacter
@export var stat: StringName

func _process(_delta) -> void:
	$HBoxContainer/StatValue.text = str(PlayerStats.get(stat))

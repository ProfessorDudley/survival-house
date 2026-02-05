extends Control

@export var player: PlayerCharacter
@export var stat: StringName

func _process(_delta) -> void:
	return
	$HBoxContainer/StatValue.text = str(player.player_stats.get(stat))

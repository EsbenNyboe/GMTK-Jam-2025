extends Node

@onready var yell_audio: AudioStreamPlayer = $Yell_Audio

var has_jumped: bool = false
var has_landed: bool = false

func _process(delta: float) -> void:
	if !has_jumped && JumpingPlayer.instance:
		has_jumped = true
		yell_audio.play()
	
	if !has_landed && has_jumped && JumpingPlayer.instance.game_over:
		has_landed = true
		yell_audio.stop()

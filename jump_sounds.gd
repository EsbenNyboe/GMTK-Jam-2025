extends Node

@onready var yell_audio: AudioStreamPlayer = $Yell_Audio
@onready var grunt_audio: AudioStreamPlayer = $Grunt_Audio
@onready var impact_audio: AudioStreamPlayer = $Impact_Audio
@onready var wind_audio: AudioStreamPlayer = $Wind_Audio

var has_jumped: bool = false
var has_landed: bool = false

func _process(delta: float) -> void:
	if !has_jumped && JumpingPlayer.instance:
		has_jumped = true
		yell_audio.play()
		wind_audio.volume_linear = 1
	
	if !has_landed && has_jumped && PlayerRagdoll.instance:
		has_landed = true
		yell_audio.stop()
		grunt_audio.play()
		impact_audio.play()
		wind_audio.volume_linear = 0

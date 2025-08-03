extends Button

@onready var button: Button = $"."
@onready var speaker_off: Sprite2D = $SpeakerOff
@onready var speaker_on: Sprite2D = $SpeakerOn

var muted: bool = false
var master_bus_index = AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(on_pressed)
	speaker_on.visible = !muted
	speaker_off.visible = muted

func on_pressed() -> void:
	muted = !muted
	speaker_on.visible = !muted
	speaker_off.visible = muted
	AudioServer.set_bus_mute(master_bus_index, muted)

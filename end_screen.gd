extends Node

@onready var message: RichTextLabel = $CenterContainer/TextureRect/Message

const TEMPLATE = "[center]You jumped [b]{0}[/b] meters![/center]"

func _process(delta: float) -> void:
	var score = str("%.2f" % MainScene.instance.jump_length)
	message.text = TEMPLATE.format([score])
	if Input.is_action_just_pressed("jump") || Input.is_action_just_pressed("swing"):
		get_tree().reload_current_scene()

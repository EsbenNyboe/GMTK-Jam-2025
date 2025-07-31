extends Node2D

@onready var player: RigidBody2D = $Player

@export var force: float = 1

func _process(delta: float) -> void:
	if Input.is_action_pressed("swing"):
		print("space pressed!")
		player.apply_force(Vector2.UP * force)
	
	if Input.is_action_just_pressed("swing"):
		print("space just pressed!")
		#player.add_constant_central_force(Vector2.UP * force)
		#player.add_constant_force(Vector2.UP * force)

extends Node2D

@onready var player: RigidBody2D = $Player

func _process(delta: float) -> void:
	if Input.is_action_pressed("swing"):
		print("Swing!")
	

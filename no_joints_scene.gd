extends Node2D

@onready var swing_mount: RigidBody2D = $SwingMount
@export var torque_amount: float = 1

func _process(delta: float) -> void:
	if Input.is_action_pressed("swing"):
		print("torque!")
		swing_mount.apply_torque(torque_amount * delta)

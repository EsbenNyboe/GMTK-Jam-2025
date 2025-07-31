extends Node3D

@export var torque_amount: float = 10
@onready var swing_mount: RigidBody3D = $SwingMount

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("swing"):
		swing_mount.apply_torque(Vector3.BACK * torque_amount)

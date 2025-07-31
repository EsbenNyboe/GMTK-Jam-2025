extends Node3D

@export var torque_amount: float = 10
@export var force_amount: float = 10
@onready var swing_mount: RigidBody3D = $SwingMount
@onready var swing_seat: RigidBody3D = $SwingSeat

var start_height: float
var is_above_start_height: bool
var time_since_last_swing: float = 0

func _ready() -> void:
	start_height = swing_seat.position.y + 0.1

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("swing"):
		swing_mount.apply_torque(Vector3.BACK * torque_amount)

	if Input.is_action_pressed("swing"):
		swing_seat.apply_force(Vector3.RIGHT * force_amount)
	
	time_since_last_swing += delta
	if swing_seat.position.y > start_height:
		is_above_start_height = true
	else:
		if is_above_start_height:
			print(time_since_last_swing)
			time_since_last_swing = 0
		is_above_start_height = false

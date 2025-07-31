extends Node3D

@export var torque_amount: float = 10
@export var force_amount: float = 10
@onready var swing_mount: RigidBody3D = $SwingMount
@onready var swing_seat: RigidBody3D = $SwingSeat

@export var burst_duration: float = 0.2;

var time_since_last_burst: float = 100000


var start_height: float
var is_above_start_height: bool
var time_since_last_swing: float = 0

func _ready() -> void:
	start_height = swing_seat.position.y + 0.1

func _physics_process(delta: float) -> void:
	time_since_last_burst += delta
	if time_since_last_burst < burst_duration:
		swing_mount.apply_torque(Vector3.BACK * torque_amount)
	
	if Input.is_action_just_pressed("swing"):
		time_since_last_burst = 0

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

class_name MainScene

extends Node3D

static var instance

@export var torque_amount: float = 10
@export var force_amount: float = 10
@onready var swing_mount: RigidBody3D = $SwingMount
@onready var swing_seat: RigidBody3D = $SwingSeatJoint

@export var burst_duration: float = 0.2

@export var jump_multiplier: float = 1.5

const JUMPING_PLAYER = preload("res://jumping_player.tscn")

var time_since_last_burst: float = 100000

var start_height: float
var is_above_start_height: bool
var time_since_last_swing: float = 0
@onready var sitting_player: Node3D = $SwingMount/SwingSeat/SittingPlayer
@onready var camera_controller: CameraController = $Camera3D
const START_SCREEN = preload("res://start_screen.tscn")
const END_SCREEN = preload("res://end_screen.tscn")

var is_jumping: bool = false
var jumping_player_instance: Node3D
var start_screen : Node

var jump_length: float

func _ready() -> void:
	instance = self
	start_height = swing_seat.position.y + 0.1
	
	start_screen = START_SCREEN.instantiate()
	add_child(start_screen)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") && start_screen:
		start_screen.queue_free()
	if Input.is_action_just_pressed("swing") && start_screen:
		start_screen.queue_free()
	
	if is_jumping:
		camera_controller.set_velocity(jumping_player_instance.linear_velocity, jumping_player_instance.global_position)
		return

	if Input.is_action_just_pressed("jump"):
		jumping_player_instance = JUMPING_PLAYER.instantiate()
		jumping_player_instance.position = sitting_player.global_position
		jumping_player_instance.rotation = sitting_player.global_rotation
		jumping_player_instance.linear_velocity = swing_seat.linear_velocity * jump_multiplier
		jumping_player_instance.angular_velocity = swing_mount.angular_velocity
		
		add_child(jumping_player_instance)
		get_tree().queue_delete(sitting_player)
		is_jumping = true

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

func set_score(score: float) -> void:
	jump_length = score

func finish_game() -> void:
	var tween = create_tween()
	tween.tween_interval(1)
	tween.tween_callback(add_child.bind(END_SCREEN.instantiate()))

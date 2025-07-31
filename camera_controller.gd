class_name CameraController

extends Camera3D

@export_range(0.001, 1) var lerp_factor_start: float = 0.1
@export_range(0.001, 1) var lerp_factor_end: float = 0.1
@export var lerp_trajectory_duration: float = 1
var is_lerping: bool = false
var time_since_start_lerping: float = 0

var target_velocity: Vector3 = Vector3.ZERO
var velocity: Vector3 = Vector3.ZERO

func set_velocity(new_velocity: Vector3) -> void:
	target_velocity = new_velocity
	is_lerping = true

func _physics_process(delta: float) -> void:
	if !is_lerping:
		return
	
	time_since_start_lerping += delta
	var current_lerp_factor = lerp(lerp_factor_start, lerp_factor_end, time_since_start_lerping / lerp_trajectory_duration)
	current_lerp_factor = clampf(current_lerp_factor, lerp_factor_start, lerp_factor_end)
	velocity = lerp(velocity, target_velocity, current_lerp_factor)
	position.x += velocity.x * delta
	position.y += velocity.y * delta

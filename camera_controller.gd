class_name CameraController

extends Camera3D

@export_range(0.001, 1) var lerp_factor_start: float = 0.1
@export_range(0.001, 1) var lerp_factor_end: float = 1
@export var lerp_timer_duration: float = 10
var lerp_timer: float = 0

var target_velocity: Vector3 = Vector3.ZERO
var velocity: Vector3 = Vector3.ZERO

func set_velocity(new_velocity: Vector3, new_target: Vector3) -> void:
	target_velocity = new_velocity

func _physics_process(delta: float) -> void:
	lerp_timer += delta
	lerp_timer = clampf(lerp_timer, 0, 1)
	
	var current_lerp = lerp(lerp_factor_start, lerp_factor_end, lerp_timer / lerp_timer_duration)
	
	velocity = lerp(velocity, target_velocity, current_lerp)
	position.x += velocity.x * delta
	position.y += velocity.y * delta

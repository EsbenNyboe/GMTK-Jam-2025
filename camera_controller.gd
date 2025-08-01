class_name CameraController

extends Camera3D

@export_range(0.001, 1) var lerp_factor_start: float = 0.1
@export_range(0.001, 1) var lerp_factor_end: float = 1
@export var lerp_timer_duration: float = 10

@export var catch_up_acceleration: float = 0.1

var lerp_timer: float = 0

var target_velocity: Vector3 = Vector3.ZERO
var velocity: Vector3 = Vector3.ZERO
var target_position: Vector3 = Vector3.ZERO

func _ready() -> void:
	target_position = global_position

func set_velocity(new_velocity: Vector3, new_target_position: Vector3) -> void:
	target_velocity = new_velocity
	target_position = new_target_position

func _physics_process(delta: float) -> void:
	lerp_timer += delta
	lerp_timer = clampf(lerp_timer, 0, 1)
	
	var current_lerp = lerp(lerp_factor_start, lerp_factor_end, lerp_timer / lerp_timer_duration)
	velocity = lerp(velocity, target_velocity, current_lerp)
	
	var catch_up_vector = Vector2.ZERO
	catch_up_vector.x = 0 if target_position.x - global_position.x < 1 else catch_up_acceleration if velocity.x > 0 else -catch_up_acceleration
	catch_up_vector.y = 0 if target_position.y - global_position.y < 1 else catch_up_acceleration if velocity.y > 0 else -catch_up_acceleration
	catch_up_vector = lerp(Vector2.ZERO, catch_up_vector, lerp_timer)
	
	position.x += velocity.x * delta + catch_up_vector.x
	position.y += velocity.y * delta + catch_up_vector.y

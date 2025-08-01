class_name CameraController

extends Camera3D

@export_range(0.001, 1) var lerp_factor_start: float = 0.1
@export_range(0.001, 1) var lerp_factor_end: float = 1
@export var lerp_timer_duration: float = 10

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
	if !JumpingPlayer.instance:
		return

	lerp_timer += delta
	lerp_timer = clampf(lerp_timer, 0, lerp_timer_duration)
	
	var current_lerp = lerp(lerp_factor_start, lerp_factor_end, lerp_timer / lerp_timer_duration)
	velocity = lerp(velocity, target_velocity, current_lerp)
	
	var position_from_velocity = position 
	position_from_velocity.x += velocity.x * delta
	position_from_velocity.y += velocity.y * delta
		
	position.x = lerp(position_from_velocity.x, target_position.x, lerp_timer / lerp_timer_duration)
	position.y = lerp(position_from_velocity.y, target_position.y, lerp_timer / lerp_timer_duration)

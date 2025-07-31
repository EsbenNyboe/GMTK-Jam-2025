class_name CameraController

extends Camera3D

@export_range(0.001, 1) var lerp_factor: float = 0.1

var target_velocity: Vector3 = Vector3.ZERO
var velocity: Vector3 = Vector3.ZERO

func set_velocity(new_velocity: Vector3) -> void:
	target_velocity = new_velocity

func _physics_process(delta: float) -> void:
	velocity = lerp(velocity, target_velocity, lerp_factor)
	position.x += velocity.x * delta
	position.y += velocity.y * delta

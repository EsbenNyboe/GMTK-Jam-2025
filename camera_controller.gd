class_name CameraController

extends Camera3D

var velocity: Vector3 = Vector3.ZERO

func set_velocity(new_velocity: Vector3) -> void:
	velocity = new_velocity

func _physics_process(delta: float) -> void:
	position.x += velocity.x * delta
	position.y += velocity.y * delta

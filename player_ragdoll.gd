class_name PlayerRagdoll

extends RigidBody3D

static var instance: PlayerRagdoll

func _ready() -> void:
	instance = self

func _physics_process(delta: float) -> void:
	if linear_velocity.length() > 0.1:
		MainScene.instance.set_score(global_position.x)

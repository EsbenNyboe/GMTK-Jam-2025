extends RigidBody3D

func _process(delta: float) -> void:
	if position.y < -10:
		get_tree().reload_current_scene()

extends RigidBody3D

func _process(delta: float) -> void:
	if position.y < -1:
		print("game over")
		var tween = create_tween()
		tween.tween_interval(2)
		tween.tween_callback(get_tree().reload_current_scene)

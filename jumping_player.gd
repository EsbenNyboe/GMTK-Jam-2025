extends RigidBody3D

var game_over: bool = false

func _process(delta: float) -> void:
	if position.y < -1 && !game_over:
		game_over = true
		print("jump length: ", position.x, " meters")
		var tween = create_tween()
		tween.tween_interval(2)
		tween.tween_callback(get_tree().reload_current_scene)

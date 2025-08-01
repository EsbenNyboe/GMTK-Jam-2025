extends RigidBody3D

var game_over: bool = false

func _process(delta: float) -> void:
	if position.y < -1 && !game_over:
		game_over = true
		print("jump length: ", position.x, " meters")
		MainScene.instance.finish_game()
	
	if game_over:
		MainScene.instance.set_score(position.x)

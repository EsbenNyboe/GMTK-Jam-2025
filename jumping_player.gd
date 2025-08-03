class_name JumpingPlayer

extends RigidBody3D

static var instance

const PLAYER_RAGDOLL = preload("res://player_ragdoll.tscn")
@onready var fly_animated_sprite_3d: AnimatedSprite3D = $Fly_AnimatedSprite3D

var game_over: bool = false

func _ready() -> void:
	instance = self

func _process(delta: float) -> void:
	if position.y < -1 && !game_over:
		game_over = true
		MainScene.instance.finish_game()
		fly_animated_sprite_3d.queue_free()
		var ragdoll_instance = PLAYER_RAGDOLL.instantiate()
		ragdoll_instance.global_position = global_position
		ragdoll_instance.global_rotation = global_rotation
		ragdoll_instance.linear_velocity = linear_velocity
		ragdoll_instance.angular_velocity = angular_velocity
		add_child(ragdoll_instance)

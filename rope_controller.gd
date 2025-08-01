extends Node3D

@export var rope_visual: MeshInstance3D
@export var rope_joint: Node3D

func _physics_process(delta: float) -> void:
	var point_start = global_position
	var point_end = rope_joint.global_position
	var diff = point_end - point_start
	var direction = diff.normalized()
	var length = diff.length()
	var middle = point_start + direction * length / 2
	rope_visual.global_position = middle
	rope_visual.global_rotation = rope_joint.global_rotation
	rope_visual.scale = (Vector3(0.05, length, 0.05))

extends Node3D

@export var rope_visual: MeshInstance3D
@export var rope_joint: Node3D

func _physics_process(delta: float) -> void:
	var end = rope_joint.global_position
	var start = global_position

	var direction = end - start
	var length = direction.length()

	var dir_norm = direction.normalized()
	var up = dir_norm
	var right = up.cross(Vector3.FORWARD).normalized()
	if right == Vector3.ZERO:
		right = Vector3.RIGHT
	var forward = right.cross(up).normalized()

	var basis = Basis()
	basis.x = right
	basis.y = up
	basis.z = forward

	# Apply transform
	var thickness = 0.05
	var mid_point = start + direction * 0.5
	rope_visual.global_transform = Transform3D(basis, mid_point)
	rope_visual.scale = Vector3(thickness, length, thickness)

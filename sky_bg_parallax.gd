extends Node3D

const SKY_BACKGROUND_ELEMENT = preload("res://sky_background_element.tscn")
@export var ring_count: int = 1

@export var mesh_scale: float = 10
@export var mesh_distance: float = 10

func _ready() -> void:
	for x in range(-ring_count, ring_count):
		for y in range(-ring_count, ring_count):
			spawn(x, y)

	
func spawn(x: float, y: float) -> void:
	var instance = SKY_BACKGROUND_ELEMENT.instantiate()
	instance.position.z = -mesh_distance
	instance.position.x = mesh_scale * x
	instance.position.y = mesh_scale * y
	instance.scale = Vector3(mesh_scale, mesh_scale, mesh_scale)
	add_child(instance)

extends Node3D

const FLOOR_BACKGROUND_ELEMENT = preload("res://floor_background_element.tscn")
@onready var initial_mesh: MeshInstance3D = $SkyBackgroundElement
@export var ring_count: int = 1

@export var mesh_scale: float = 10
@export var mesh_distance: float = 10
@export var floor_height: float = -1

func _ready() -> void:
	for x in range(-ring_count, ring_count):
		spawn(x)
	
func spawn(x: float) -> void:
	var instance = FLOOR_BACKGROUND_ELEMENT.instantiate()
	instance.position.z = -mesh_distance
	instance.position.x = mesh_scale * x
	instance.position.y = floor_height
	instance.scale = Vector3(mesh_scale, mesh_scale, mesh_scale)
	add_child(instance)

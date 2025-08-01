extends Node3D

const CLOUD_1 = preload("res://cloud_1.tscn")
const CLOUD_2 = preload("res://cloud_2.tscn")
const CLOUD_3 = preload("res://cloud_3.tscn")
const CLOUD_4 = preload("res://cloud_4.tscn")
const CLOUD_5 = preload("res://cloud_5.tscn")

@export var element_index: int

@export var mesh_scale: float = 10
@export var height: float = -1

@export var distance: float = 10
@export var spacing_x: float = 40
@export var spacing_y: float = 40
@export var repeats: int = 1

@export var offset: float = 1

var hill_to_spawn: PackedScene

func _ready() -> void:
	match element_index:
		1:
			hill_to_spawn = CLOUD_1
		2:
			hill_to_spawn = CLOUD_2
		3:
			hill_to_spawn = CLOUD_3
		4:
			hill_to_spawn = CLOUD_4
		5:
			hill_to_spawn = CLOUD_5
	
	for x in range(-repeats, repeats):
		for y in range(0, repeats):
			spawn(x, y)

func spawn(x: float, y: float) -> void:
	var instance = hill_to_spawn.instantiate()
	instance.position.z = -distance
	instance.position.x = spacing_x * x + offset
	instance.position.y = spacing_y * y + height
	instance.scale.x = mesh_scale
	instance.scale.y = mesh_scale
	add_child(instance)

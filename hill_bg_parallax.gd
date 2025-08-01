extends Node3D

const HILL_BACKGROUND_ELEMENT_1 = preload("res://hill_background_element_1.tscn")
const HILL_BACKGROUND_ELEMENT_2 = preload("res://hill_background_element_2.tscn")
const HILL_BACKGROUND_ELEMENT_3 = preload("res://hill_background_element_3.tscn")
const HILL_BACKGROUND_ELEMENT_4 = preload("res://hill_background_element_4.tscn")

@export var element_index: int

@export var mesh_scale: float = 10
@export var height: float = -1

@export var distance: float = 10
@export var spacing: float = 5
@export var repeats: int = 1

@export var offset: float = 1

var hill_to_spawn: PackedScene

func _ready() -> void:
	hill_to_spawn = HILL_BACKGROUND_ELEMENT_1 if element_index == 1 else HILL_BACKGROUND_ELEMENT_2 if element_index == 2 else HILL_BACKGROUND_ELEMENT_3 if element_index == 3 else HILL_BACKGROUND_ELEMENT_4
	
	for x in range(-repeats, repeats):
		spawn(x)

func spawn(x: float) -> void:
	var instance = hill_to_spawn.instantiate()
	instance.position.z = -distance
	instance.position.x = spacing * x + offset
	instance.position.y = height
	instance.scale = Vector3(mesh_scale, mesh_scale, mesh_scale)
	add_child(instance)

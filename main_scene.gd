extends Node3D

@onready var rigid_body_3d: RigidBody3D = $RigidBody3D
@export var torque_amount: float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("swing"):
		rigid_body_3d.apply_torque(Vector3.BACK * torque_amount)

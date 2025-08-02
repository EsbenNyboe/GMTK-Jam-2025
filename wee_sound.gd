extends AudioStreamPlayer

@onready var swing_seat_joint: RigidBody3D = $"../SwingSeatJoint"
@export var top_point: float = 3.0
@export var bottom_point: float = 0.5

var has_passed_top_point: bool = false
var has_passed_bottom_point: bool = false

func _process(delta: float) -> void:
	if JumpingPlayer.instance:
		return
	
	var above_top_point = swing_seat_joint.global_position.y > top_point
	var below_bottom_point = swing_seat_joint.global_position.y < bottom_point
	var on_left_side = swing_seat_joint.global_position.x < 0
	
	if above_top_point && on_left_side && has_passed_bottom_point && !has_passed_top_point:
		has_passed_top_point = true
		has_passed_bottom_point = false
		play(0.78)
	
	if below_bottom_point:
		has_passed_top_point = false
		has_passed_bottom_point = true
	

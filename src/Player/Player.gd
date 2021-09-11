extends KinematicBody2D

onready var animation_tree = $AnimationTree

var speed := 100
var path := PoolVector2Array() setget set_path

var look_at: Vector2

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	var move_distance = speed * delta
	move_along_path(move_distance)

func set_look_direction(direction: Vector2):
	look_at = direction
	animation_tree.set("parameters/Idle/blend_position", look_at)

func move_along_path(distance: float) -> void:
	var start_point = position
	for i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[0])
		
		if distance <= distance_to_next && distance >= 0.0:
			var direction_vector = (path[0] - global_position)
			animation_tree.get("parameters/playback").travel("Move")
			animation_tree.set("parameters/Move/blend_position", direction_vector)
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif path.size() == 1 && distance > distance_to_next:
			animation_tree.get("parameters/playback").travel("Idle")
			animation_tree.set("parameters/Idle/blend_position", look_at)
			position = path[0]
			set_process(false)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)


func set_path(value: PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)

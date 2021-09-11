extends CanvasLayer

onready var animation_player = $AnimationPlayer

var scene: String

var player_look_direction: Vector2
var player_room_position: Vector2

func change_scene(new_scene, anim):
	scene = new_scene
	animation_player.play(anim)
	
func _new_scene():
	get_tree().change_scene(scene)

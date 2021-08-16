extends Area2D

export(String, FILE) var next_room_name
export(Vector2) var player_look_direction: Vector2

var next_room

func _on_Exit_body_entered(body: Node) -> void:
	if body.name == "Player":
		SceneLoader.change_scene(next_room_name, 'fade')

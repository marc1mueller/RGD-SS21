extends Area2D

export(String, FILE) var next_room_name

export(Vector2) var player_look_direction: Vector2

export(Vector2) var player_next_room_look_direction: Vector2
export(Vector2) var player_room_position: Vector2

var next_room

func _on_Exit_body_entered(body: Node) -> void:
	if body.name == "Player":
		
		SceneLoader.player_room_position = player_room_position
		SceneLoader.player_look_direction = player_next_room_look_direction
		SceneLoader.change_scene(next_room_name, 'fade')

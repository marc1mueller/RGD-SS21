extends Node2D
class_name Room_position

onready var items: Array = get_children()

export(Vector2) var player_look_direction: Vector2

func update_items():
	items = get_children()

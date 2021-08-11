extends Node2D
class_name Room_position

onready var items: Array = get_children()


func update_items():
	items = get_children()

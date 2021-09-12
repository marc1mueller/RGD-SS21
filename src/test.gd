extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dialog = Dialogic.start("elternbabbeln")
	add_child(dialog)

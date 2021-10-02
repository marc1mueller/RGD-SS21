extends Control

export var text = ""
onready var label = $TextureRect/ColorRect/Label

func _ready() -> void:
	label.text = text

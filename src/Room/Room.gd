extends Node
class_name Room

onready var command_processor = $CommandProcessor
onready var player = $YSort/Player

onready var navigation = $Navigation
onready var positions: Array = $Positions.get_children()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	command_processor.initialize(self, player)

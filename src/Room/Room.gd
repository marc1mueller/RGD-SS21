extends Node
class_name Room

onready var command_processor = $CommandProcessor
onready var player = $YSort/Player

onready var navigation = $Navigation
onready var positions: Array = $Positions.get_children()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	command_processor.initialize(self, player)
	if SceneLoader.player_room_position != Vector2.ZERO:
		player.position = SceneLoader.player_room_position
	if SceneLoader.player_look_direction != Vector2.ZERO:
		player.set_look_direction(SceneLoader.player_look_direction)

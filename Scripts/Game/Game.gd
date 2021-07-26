extends Node

onready var command_processor = $CommandProcessor
onready var room_manager = $RoomManager
onready var navigation = $Navigation2D
onready var player = $Player


var current_room: Room = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_room = room_manager.get_child(0)
	command_processor.initialize(current_room, navigation, player)


func _on_Input_text_entered(new_text: String) -> void:
	if new_text.empty():
		return
	
	command_processor.process_command(new_text)

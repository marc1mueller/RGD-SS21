extends Node

onready var command_processor = $CommandProcessor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Input_text_entered(new_text: String) -> void:
	if new_text.empty():
		return
	
	var response = command_processor.process_command(new_text)

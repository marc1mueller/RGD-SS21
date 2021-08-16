extends LineEdit

var history: Array = []

var index_message_selected = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		if history.size() > index_message_selected:
			text = history[index_message_selected]
			index_message_selected = index_message_selected + 1
	elif Input.is_action_just_pressed("ui_down"):
		if history.size() > 0 && index_message_selected > 0:
			index_message_selected = index_message_selected - 1
			text = history[index_message_selected]


func _on_Input_text_entered(new_text: String) -> void:
	if new_text.empty():
		return
	
	history.push_front(new_text)
	clear()

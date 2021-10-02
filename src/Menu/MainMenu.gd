extends MarginContainer

#constants
export(String, FILE) var first_scene

# Path to the Selector's
onready var selector_one = $Background/Menu/NewGame/HBoxContainer/Selector
onready var selector_two = $Background/Menu/Exit/HBoxContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)

# Choose option
func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		SceneLoader.change_scene(first_scene, 'fade')
	elif _current_selection == 1:
		get_tree().quit()

#Set Arrow on selected option
func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"

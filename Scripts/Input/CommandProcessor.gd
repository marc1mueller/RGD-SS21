extends Node

var current_room: Room = null
var current_position: Room_position = null

var inventory = preload("res://Resources/Inventory/Inventory.tres")
var sword = preload("res://Resources/Items/Sword.tres")

var navigation = null

var player = null


func initialize(start_room: Room, navigation, player):
	self.current_room = start_room
	self.navigation = navigation
	self.player = player


func process_command(input: String):
	var words = input.split(" ", false)
	if words.size() == 0:
		printerr("Error: no words found!")
	
	var first_word = words[0].to_lower()
	
	var second_word = ""
	if words.size() > 1:
		second_word = words[1].to_lower()
	
	match first_word:
		"move":
			move(second_word)
		"help":
			help()
		"take":
			take(second_word)
		_:
			print("Unknown command - please try again!")


func move(second_word: String):
	for item in current_room.room_nodes:
		if item.name == second_word.to_lower():
			current_position = item
			var new_path = navigation.get_simple_path(player.global_position, item.global_position)
			player.path = new_path


func take(second_word: String):
	if current_position == null:
		return
	for item in current_position.items:
		if item.name.to_lower() == second_word.to_lower():
			for i in range (0, inventory.items.size()):
				if inventory.items[i] == null:
					inventory.set_items(i, item.itemData)
					item.queue_free()
					return


func help() -> String:
	return "you can use these commands 1.moveto [location], interactwith [person/object], take [object], use [object], stash [object], equip [object], combinexwithy [x object + y object]"

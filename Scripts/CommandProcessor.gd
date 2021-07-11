extends Node

func process_command(input: String):
	var words = input.split(" ", false)
	if words.size() == 0:
		printerr("Error: no words found!")
	
	var first_word = words[0].to_lower()
	var second_word = ""
	if words.size() > 1:
		second_word = words[1].to_lower()
	
	match first_word:
		"goto":
			goto(second_word)
		"help":
			help()
		_:
			pass


func goto(second_word: String):
	pass


func help():
	pass

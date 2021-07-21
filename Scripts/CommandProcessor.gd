extends Node

func process_command(input: String):
	return "some outputya"
	var words = input.split(" ", false)
	if words.size() == 0:
		printerr("Error: no words found!")
	
	var first_word = words[0].to_lower()
	var second_word = ""
	if words.size() > 1:
		second_word = words[1].to_lower()
	match first_word:
		"moveto":
			moveto(second_word)
		"interactwith":
			interactwith(second_word)
		"take":
			take(second_word)
		"use":
			use(second_word)
		"stash":
			stash(second_word)
		"equip":
			equip(second_word)
			
		"combinexwithy":
			combinexwithy(second_word, second_word)
			
			
		"help":
			help()
		_:
			return "Unknown command - please try again!"


func moveto(second_word: String):
	if second_word == "":
		return "Please move to some object..."
	return "you move to %s" % second_word

func interactwith(second_word: String):
	if second_word == "":
		return "Please do interaction with Person/Object?"
	return "your interaction with %s" %second_word

func take(second_word: String):
	if second_word == "":
		return "Please take some object"
	return "you have taken %s" %second_word

func use(second_word: String):
	if second_word == "":
		return "Please use the object"
	return "you have used %s" %second_word
	
func stash(second_word: String):
	if second_word == "":
		return "please stow away the Items"
	return "you have stash your items%" %second_word

func equip(second_word: String):
	if second_word == "":
		return "please equip the objects"
	return "you have equiped %s" %second_word

func combinexwithy(second_word: String, some_other_String):
	if second_word == "":
		return "Please combine x with y"
	return"you have combined %s %s" % [second_word, some_other_String]

func help():
	return "you can use these commands 1.moveto [location], interactwith [person/object], take [object], use [object], stash [object], equip [object], combinexwithy [x object + y object]"

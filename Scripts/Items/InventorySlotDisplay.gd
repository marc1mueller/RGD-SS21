extends CenterContainer

onready var itemTextureRect = $TextureRect/CenterContainer/ItemTextureRect

func display_item(item):
	if item is Item:
		itemTextureRect.texture = item.texture
	else:
		itemTextureRect.texture = null

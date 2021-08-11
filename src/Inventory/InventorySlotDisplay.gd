extends CenterContainer

onready var itemTextureRect = $TextureRect/CenterContainer/ItemTextureRect

func display_item(item):
	if item is Item:
		itemTextureRect.texture = item.item_texture
	else:
		itemTextureRect.texture = null

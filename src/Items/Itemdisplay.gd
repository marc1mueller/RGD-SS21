extends Sprite

export(Resource) var itemData = null

func _ready() -> void:
	name = itemData.item_name
	texture = itemData.item_texture


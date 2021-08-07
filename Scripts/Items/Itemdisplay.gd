extends Sprite

export(Resource) var itemData = null

func _ready() -> void:
	name = itemData.name
	texture = itemData.texture


extends Resource
class_name Inventory

signal item_changed(indexes)

export(Array, Resource) var items = [
	null, null, null, null, null, null, null, null, null, null, 
]

func set_items(index, item):
	var previousItem = items[index]
	items[index] = item
	emit_signal("item_changed", [index])
	return previousItem


func swap_items(index, target_index):
	var targetItem = items[target_index]
	var item = items[index]
	items[target_index] = item
	items[index] = targetItem
	emit_signal("item_changed", [index, target_index])


func remove_item(index):
	var previousItem = items[index]
	items[index] = null
	emit_signal("item_changed", [index])
	return previousItem

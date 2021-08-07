extends HBoxContainer

var inventory = preload("res://Resources/Inventory/Inventory.tres")


func _ready() -> void:
	inventory.connect("item_changed", self, "_on_items_changed")
	update_inventory_display()


func update_inventory_display():
	for index in inventory.items.size():
		update_inventory_slot_display(index)


func update_inventory_slot_display(index):
	var inventorySlotDisplay = get_child(index)
	var item = inventory.items[index]
	inventorySlotDisplay.display_item(item)


func _on_items_changed(indexes):
	for index in indexes:
		update_inventory_slot_display(index)

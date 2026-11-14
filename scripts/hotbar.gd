extends HBoxContainer


const SLOT_SIZE := Vector2(64, 64)

func _ready() -> void:
	var p:= get_tree().get_first_node_in_group("player")
	p.inventory_changed.connect(_refresh.bind(p))
	_refresh(p)
	
func _refresh(player: Node) -> void:
	for child in get_children():
		child.queue_free()

	for item in player.inventory:
		var count: int = player.inventory[item]
		if count <= 0:
			continue

		var slot := PanelContainer.new()
		slot.custom_minimum_size = SLOT_SIZE

		var label := Label.new()
		label.text = "%s\n%d" % [item.capitalize(), count]
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

		slot.add_child(label)
		add_child(slot)

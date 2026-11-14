extends Area2D

@onready var crafting_menu: Node2D = $"../CanvasLayer/CraftingMenu"

func _on_body_entered(body: Node2D) -> void:
	crafting_menu.show()
	
func _on_body_exited(body: Node2D) -> void:
	crafting_menu.hide()

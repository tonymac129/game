extends Area2D

@onready var player: CharacterBody2D = %Player
@onready var label: Label = $Label

var revived = false

func _process(delta: float) -> void:
	if revived:
		label.text="Revived!"
	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and entered and player.inventory["miracle"]:
			print("test")
			player.inventory["miracle"] = false
			revived = true
		if player.inventory["miracle"]:
			label.text="Click to revive this person!"
		else:
			label.text="You don't have miracle potion to revie this person..."

var entered = false

func _on_body_entered(body: Node2D) -> void:
	entered = true
	label.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	if !revived:
		label.hide()

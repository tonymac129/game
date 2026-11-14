extends Node

@onready var button: Button = $Button

func _ready() -> void:
	button.pressed.connect(restart)

func restart()->void:
	get_tree().change_scene_to_file("res://scenes/splash2.tscn")	

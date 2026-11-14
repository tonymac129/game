extends Node2D
@onready var shovel_upgrade: Button = $ScrollContainer/VBoxContainer/HBoxContainer/Label2
@onready var pickaxe_upgrade: Button = $ScrollContainer/VBoxContainer/HBoxContainer2/Button
@onready var bottle_upgrade: Button = $ScrollContainer/VBoxContainer/HBoxContainer3/Label2
@onready var miracle_upgrade: Button = $ScrollContainer/VBoxContainer/HBoxContainer4/Button
@onready var button: Button = $Button
@onready var player: CharacterBody2D = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shovel_upgrade.pressed.connect(buy_shovel)
	pickaxe_upgrade.pressed.connect(buy_pickaxe)
	bottle_upgrade.pressed.connect(buy_bottle)
	miracle_upgrade.pressed.connect(buy_miracle)
	button.pressed.connect(_on_play_pressed)

func buy_shovel() -> void:
	if player.inventory["wood"] >= 10:
		player.inventory["wood"] -= 10
		player.inventory["shovel"] = true
		player.inventory_changed.emit()
		
func buy_pickaxe() -> void:
	if player.inventory["wood"] >= 30 and player.inventory["stone"] >= 20:
		player.inventory["wood"] -= 30
		player.inventory["stone"] -= 20
		player.inventory["pickaxe"] = true
		player.inventory_changed.emit()
		
func buy_bottle() -> void:
	if player.inventory["sand"] >= 20:
		player.inventory["sand"] -= 20
		player.inventory["bottle"] = true
		player.inventory_changed.emit()
		
func buy_miracle() -> void:
	if player.inventory["wood"] >= 30 and player.inventory["stone"] >= 30 and player.inventory["iron"] >= 30 and player.inventory["sand"] >= 30 and player.inventory["bottle"]:
		player.inventory["wood"] -= 30
		player.inventory["stone"] -= 30
		player.inventory["sand"] -= 30
		player.inventory["iron"] -= 30
		player.inventory["miracle"] = true
		player.inventory_changed.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	hide()

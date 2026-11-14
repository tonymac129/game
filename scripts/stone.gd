extends Area2D

@onready var player: CharacterBody2D = %Player
@onready var progress_bar: ProgressBar = $Hint/ProgressBar
@onready var hint: Control = $Hint
@onready var label: Label = $Hint/Label

var hold_time: float = 0.0
const HOLD_REQUIRED: float = 5.0

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and player.inventory["shovel"] and entered:
		hold_time += delta
		progress_bar.value = hold_time / HOLD_REQUIRED*100
		if hold_time >= HOLD_REQUIRED:
			player.inventory["stone"] += 1
			print("stone + 1 = "+str(player.inventory["stone"]))
			hold_time = 0.0
	else:
		hold_time = 0.0
	if player.inventory["shovel"]:
		label.text="Click and hold to collect stone"
	else:
		label.text="You don't have a shovel to get stone yet. Get wood to buy one!"

var entered = false

func _on_body_entered(body: Node2D) -> void:
	entered = true
	hint.show()
	print(player)

func _on_body_exited(body: Node2D) -> void:
	entered = false
	progress_bar.value = 0
	hint.hide()
	hold_time = 0

extends Area2D

@onready var player: CharacterBody2D = %Player
@onready var progress_bar: ProgressBar = $Hint/ProgressBar
@onready var hint: Control = $Hint
@onready var label: Label = $Hint/Label

var hold_time: float = 0.0
var HOLD_REQUIRED: float = 5.0

func _process(delta: float) -> void:
	if player.inventory["shovel"]:
		HOLD_REQUIRED=1.0
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and entered:
		hold_time += delta
		progress_bar.value = hold_time / HOLD_REQUIRED*100
		if hold_time >= HOLD_REQUIRED:
			player.inventory["sand"] += 1
			print("sand + 1 = "+str(player.inventory["sand"]))
			hold_time = 0.0
	else:
		hold_time = 0.0
	if player.inventory["shovel"]:
		label.text="Click and hold to collect sand"
	else:
		label.text="You don't have a shovel to get sand quickly yet. Get wood to buy one!"

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

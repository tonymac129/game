extends Node2D

@onready var button: Button = $Button
@onready var check_box: CheckBox = $CheckBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_on_play_pressed)
	check_box.button_pressed = AudioServer.is_bus_mute(AudioServer.get_bus_index("Master"))
	check_box.toggled.connect(_on_volume_off)

func _on_volume_off(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), toggled_on)

func _on_play_pressed() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

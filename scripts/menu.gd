extends Node

@onready var play: Button = $Buttons/Play
@onready var about: Button = $Buttons/About
@onready var options: Button = $Buttons/Options
@onready var quit: Button = $Buttons/Quit
const POPUP_SCENE = preload("res://scenes/about.tscn")
const OPTIONS_SCENE = preload("res://scenes/options.tscn")

func show_popup() -> void:
	var popup_instance = POPUP_SCENE.instantiate()
	add_child(popup_instance)

func show_options() -> void:
	var popup_instance = OPTIONS_SCENE.instantiate()
	add_child(popup_instance)
	# If using CanvasLayer, add to canvas layer instead so it stays on screen:
	# $CanvasLayer.add_child(popup_instance)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	about.pressed.connect(show_popup)
	options.pressed.connect(show_options)
	quit.pressed.connect(_on_quit_pressed)

func _on_play_pressed() -> void:
	print("test")
	get_tree().change_scene_to_file("res://scenes/play.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

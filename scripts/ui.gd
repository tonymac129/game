extends CanvasLayer

@onready var label: Label = $Control/Label
@onready var label_2: Label = $Control/Label2
@onready var label_3: Label = $Control/Label3
@onready var label_4: Label = $Control/Label4
@onready var player: CharacterBody2D = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Wood: "+str(player.inventory["wood"])
	label_2.text = "Stone: "+str(player.inventory["stone"])
	label_3.text = "Iron: "+str(player.inventory["iron"])
	label_4.text = "Sand: "+str(player.inventory["sand"])

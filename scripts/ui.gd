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
	
	var total_warnings: int = 1000000
	var warnings_per_frame: int = 100

	var generated: int = 0
	var batch: int = mini(
		warnings_per_frame,
		total_warnings - generated
	)

	for i in range(batch):
		generated += 1
		push_warning("Generated warning #%d" % generated)

	if generated >= total_warnings:
		set_process(false)






	

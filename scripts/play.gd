extends Node2D
@onready var npc: Area2D = $NPC
@onready var npc_2: Area2D = $NPC2
@onready var npc_3: Area2D = $NPC3
@onready var npc_4: Area2D = $NPC4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if npc.revived and npc_2.revived and npc_3.revived and npc_4.revived:
		get_tree().change_scene_to_file("res://scenes/end.tscn")

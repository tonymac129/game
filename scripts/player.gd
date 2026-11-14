extends CharacterBody2D

signal inventory_changed

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var inventory = {
	"wood": 100,
	"stone": 100,
	"iron": 100,
	"sand": 100,
	"shovel": true,
	"pickaxe": true,
	"bottle": true,
	"miracle": true,
}

var discovered = {
	"stick": false,
}

const SPEED = 300.0

func _ready()->void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
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

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("move_left", "move_right")
	var directionY := Input.get_axis("move_up", "move_down")
	if directionX == 0 and directionY==0:
		animation_player.play("idle")
	if Input.is_action_just_pressed("move_left"):
		animation_player.play("walk_left")
	if Input.is_action_just_pressed("move_right"):
		animation_player.play("walk_right")
	if Input.is_action_just_pressed("move_up"):
		animation_player.play("walk_up")
	if Input.is_action_just_pressed("move_down"):
		animation_player.play("walk_down")
		
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

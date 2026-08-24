extends CharacterBody2D

@export var HUD_manager: Node 
@onready var anim_player: AnimationPlayer = $AnimationPlayer


@onready var camera: Camera2D = $Camera2D
@export var jump_velocity: float = -400.0


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var start_position = Vector2(584,400)

@export var MAX_JUMPS: int = 2
var jump_count: int = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		# get_gravity() returns a Vector2, so we multiply by delta and add to velocity
		velocity += get_gravity() * delta
	else:
		# Reset jump count when landing on the ground
		jump_count = 0

	# Handle jump & double jump. 
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or jump_count < MAX_JUMPS:
			velocity.y = JUMP_VELOCITY
			jump_count += 1
			# Trigger the screen shake on jump
			if camera:
				camera.apply_shake(15.0)


	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Handle Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		
		# Trigger the screen shake
		if camera:
			camera.apply_shake(15.0) # Pass custom intensity if desired
	
	move_and_slide()
	
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("idle")
	else:
		anim_player.play("RESET")

	# handle respawn
	if position.y > 1000: 
		#respawn
		position = start_position
		

func _on_hitbox_area_entered(_area: Area2D) -> void:
	# load a new level
	print(_area.get_groups())
	if _area.is_in_group("bullet"):
		get_tree().change_scene_to_file("res://scenes/death_scene.tscn")

func _ready() -> void:
	HUD_manager.level_time_expired.connect(die)

func die() -> void:
	get_tree().change_scene_to_file("res://scenes/death_scene.tscn")

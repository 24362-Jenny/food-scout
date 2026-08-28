extends CharacterBody2D

@export var HUD_manager: Node 
@onready var anim_player: AnimationPlayer = $AnimationPlayer


@onready var camera: Camera2D = $Camera2D
@export var jump_velocity: float = -400.0

@onready var jump_audio = $JumpAudio

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var start_position = Vector2(584,400)

@export var MAX_JUMPS: int = 2
var jump_count: int = 0

func _physics_process(delta: float) -> void:
	# 1. Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		# Reset jumps when touching the ground
		jump_count = 0

	# 2. Handle Jump & Double Jump
	# Note: Use "ui_accept" if you haven't set up a custom "jump" action in Project Settings
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or jump_count < MAX_JUMPS:
			velocity.y = JUMP_VELOCITY
			jump_count += 1
			
			# Play audio using the @onready variable
			jump_audio.play()
			
			# Trigger screen shake
			if camera:
				camera.apply_shake(15.0)

	# 3. Horizontal Movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# 4. Apply physics
	move_and_slide()

	# 5. Respawn check
	if position.y > 1000: 
		position = start_position

func _on_hitbox_area_entered(_area: Area2D) -> void:
	# load a new level
	print(_area.get_groups())
	if _area.is_in_group("bullet"):
		die()
		get_tree().change_scene_to_file("res://scenes/death_scene.tscn")

func _ready() -> void:
	HUD_manager.level_time_expired.connect(die)

func die() -> void:
	# Hide player visual/disable physics so the player "disappears" instantly
	set_physics_process(false)
	hide()
	
	# Play the global sound
	AudioManager.play("res://sounds/1.Die sound.mp3")
	
	# Wait a fraction of a second for the sound to start/play before changing scene
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/death_scene.tscn")

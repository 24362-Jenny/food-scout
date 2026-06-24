extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -450.0
var start_position = Vector2(584,400)


func _physics_process(delta: float) -> void:
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

	move_and_slide()

	# handle respawn
	if position.y > 1000: 
		#respawn
		position = start_position
		

func _on_hitbox_area_entered(_area: Area2D) -> void:
	# load a new level
	print(_area.get_groups())
	if _area.is_in_group("bullet"):
		get_tree().change_scene_to_file("res://scenes/death_scene.tscn")
	
	

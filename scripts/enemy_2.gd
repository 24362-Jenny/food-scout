extends CharacterBody2D

func _physics_process(delta):
	# Just apply gravity so they rest on the floor, but don't move left/right
	if not is_on_floor():
		velocity.y += 980 * delta # Standard 2D gravity
	else:
		velocity.y = 0

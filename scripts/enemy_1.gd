extends CharacterBody2D

@onready var player = %level_one # Or however you reference your player node

var direction : Vector2 = Vector2.ZERO

func _physics_process(_delta):
	if player:
		direction = (player.global_position - global_position).normalized()
	
	
	velocity = Vector2.ZERO
	# Notice move_and_slide() is left out so it won't move at all

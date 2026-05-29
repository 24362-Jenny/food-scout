extends CharacterBody2D

@onready var player = %enemy1 # Or however you reference your player node

var direction : Vector2 = Vector2.ZERO

func _physics_process(_delta):
	if player:
		direction = (player.global_position - global_position).normalized()
		
		# Example: Flip the sprite based on where the player is
		if direction.x < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
			
	velocity = Vector2.ZERO
	# Notice move_and_slide() is left out so it won't move at all

extends CharacterBody2D

@onready var player = %Player # Or however you reference your player node
var direction : Vector2 = Vector2.ZERO

func _physics_process(delta):
	if player:
		direction = (player.global_position - global position).normalized()
		
	velocity = Vector2.ZERO

extends Area2D
class_name Bullet

func _ready():
	# Wait for 3.0 seconds, then delete this bullet
	await get_tree().create_timer(3.0).timeout
	queue_free()

func _process(delta):
	# Move the bullet forward
	position += transform.x * speed * delta

var speed = 300
var direction : Vector2 = Vector2.LEFT

func _ready() -> void:
	add_to_group("bullet")

var fire_cooldown = 5.0 
var time_since_last_shot = 0.0

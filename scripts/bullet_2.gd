extends Area2D
class_name Bullet

var speed = 300
var direction : Vector2 = Vector2.LEFT

func _process(delta):
	# Move the bullet forward
	translate(direction * speed * delta)

func _ready() -> void:
	add_to_group("bullet")

extends Area2D
class_name Bullet

var speed = 600
var direction : Vector2 = Vector2.UP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(direction * speed * delta)

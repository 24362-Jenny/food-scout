extends Camera2D

@export var random_strength: float = 10.0
@export var shake_fade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0

func _ready():
	rng.randomize()

func _process(delta):
	if shake_strength > 0:
		# Gradually reduce the shake strength over time
		shake_strength = lerpf(shake_strength, 0.0, shake_fade * delta)
		# Apply random offset based on current strength
		offset = random_offset()

func apply_shake(strength: float = -1.0):
	if strength > 0:
		shake_strength = strength
	else:
		shake_strength = random_strength

func random_offset() -> Vector2:
	return Vector2(
		rng.randf_range(-shake_strength, shake_strength),
		rng.randf_range(-shake_strength, shake_strength)
	)

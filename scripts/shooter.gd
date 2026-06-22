extends Node2D

var bullet_prefab = preload("res://scenes/bullet_1.tscn")

func _on_timer_timeout() -> void:
	#spawn a bullet
	var bullet = bullet_prefab.instantiate()
	add_child(bullet)

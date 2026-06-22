extends Node2D

var bullet_prefab = preload("res://scenes/bullet_2.tscn")

func _on_timer_timeout() -> void:
	#spawn a bullet
	var bullet = bullet_prefab.instantiate()
	add_child(bullet)

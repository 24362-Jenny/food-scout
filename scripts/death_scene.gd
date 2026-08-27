extends Node2D

# Inside death_scene.gd
func _ready() -> void:
	AudioManager.play("res://sounds/1.Die sound.mp3")

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")

extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	# load a new scene 
	get_tree().change_scene_to_file("res://scenes/ending_scene_level.tscn")

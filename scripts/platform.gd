extends StaticBody2D

@onready var hud_manager: Node = $"../HUDManager"
@onready var platform: StaticBody2D = $"."


func _on_area_2d_body_entered(_body: Node2D) -> void:
	
	hud_manager.update_player_falls(-1)
	

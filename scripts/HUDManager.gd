extends Node

@onready var time: Label = $"../CanvasLayer/Control/VBoxContainer/Time/Label"
@onready var timer: Timer = $"../Timer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	time.text = str(int(timer.time_left))


func update_player_falls(amount: int):
	StateOfHud.player_falls += amount

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	time.text = str(int(timer.time_left))

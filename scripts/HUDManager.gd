extends Node

@onready var time = $Control/VBoxContainer/Time
@onready var timer = $"../Timer"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	time.text = str(timer.time_left)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	time.text = str(timer.time_left)

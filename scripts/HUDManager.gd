extends Node

@onready var time: Label = $"../CanvasLayer/Control/VBoxContainer/Time/Label"
@onready var timer: Timer = $"../Timer"
@onready var countdown_timer : Timer = $"../CountdownTimer"

var level_active: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	time.text = str(int(timer.time_left))
	# Start the countdown when the level begins
	countdown_timer.start()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	time.text = str(int(timer.time_left))
	# emit the signal when the time runs out
	level_time_expired.emit()


func _on_countdown_timer_timeout() -> void:
	if level_active: 
		level_active = false
		

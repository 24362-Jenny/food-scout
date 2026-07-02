extends Node

@onready var time: Label = $"../CanvasLayer/Control/VBoxContainer/Time/Label"
@onready var timer: Timer = $"../Timer"
@onready var countdown_timer: Timer = $CountdownTimer
@onready var timer_label: Label = $TimerLabel

@export var score_multiplier: int = 100
var final_score: int = 0
var level_active: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	time.text = str(int(timer.time_left))
	# Start the countdown when the level begins
	countdown_timer.start()
	
	countdown_timer.start()
	if not level_active:
		return
	
	level_active = false
	countdown_timer.stop() #freeze the clock
	
	# Calculating score based on the remaining time
	var time_left = countdown_timer.time_left
	final_score = int(time_left * score_multiplier)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	time.text = str(int(timer.time_left))
	
	if not level_active and not countdown_timer.is_stopped():
		#update the UI text to show whole seconds left
		timer_label.text = "Time Left: " + str(ceil(countdown_timer.time_left))
	

func _on_countdown_timer_timeout() -> void:
	if level_active: 
		level_active = false
		final_score = 0
		

extends Node

var num_players = 8
var bus = "Master" # Capital 'M' for default Master bus

var available = []  # The available AudioStreamPlayer nodes.
var queue = []  # The queue of sound paths to play.

var sound_cache = {}

func _ready() -> void:
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var player = AudioStreamPlayer.new()
		add_child(player)
		available.append(player)
		# Connect signal to return the player back to the pool
		player.finished.connect(_on_stream_finished.bind(player))
		player.bus = bus


func _on_stream_finished(player: AudioStreamPlayer) -> void:
	# Return the player back to the available pool
	available.append(player)


func play(sound_path: String) -> void:
	if not sound_cache.has(sound_path):
		sound_cache[sound_path] = load(sound_path)
	
	queue.append(sound_path)

func _process(_delta: float) -> void:
	if not queue.is_empty() and not available.is_empty():
		var player = available.pop_front()
		var stream_path = queue.pop_front()
		var stream = sound_cache.get(stream_path)
		
		if stream:
			player.stream = stream
			player.play()
		else:
			available.append(player)
			push_error("Could not load sound file at: " + stream_path)

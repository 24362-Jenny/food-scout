extends Node


var score: int = 0
var time_taken: int = 0
var falls: int = 0

func add_score():
	score += 1

func reset():
	score = 0
	time_taken = 0
	falls = 0

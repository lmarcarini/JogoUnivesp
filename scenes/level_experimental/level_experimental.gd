extends Node2D

signal level_change

var timer

func _ready():
	timer=get_node("Timer")
	timer.connect("timer_ended",self,"_on_gameover")


func _on_gameover():
	print("gameover")
	emit_signal("level_change","gameover")

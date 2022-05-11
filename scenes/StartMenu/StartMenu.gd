extends Control

signal level_change

var startButton

func _ready():
	startButton = get_node("StartButton")
	startButton.connect("pressed", self, "_on_Start_Pressed")

func _on_Start_Pressed():
	emit_signal("level_change", "start")

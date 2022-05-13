extends Node


var level
var nextLevel
var LevelOpening
var audioPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_node("Level")
	LevelOpening = get_node("LevelOpening")
	audioPlayer = get_node("AudioStreamPlayer")
	level.connect("level_change", self, "_on_level_change")
	pass # Replace with function body.
	
	
func _on_level_change(level_name):
	print("Start transition")
	print(level_name)
	match level_name:
		"start":
			audioPlayer.play()
			_start_level("res://scenes/Level_TirarLixo/Level_TirarLixo.tscn")
		"success":
			_start_level("res://scenes/Level_TirarLixo/Level_TirarLixo.tscn")
		"gameover":
			nextLevel = load("res://scenes/GameOver/GameOver.tscn").instance()
			add_child(nextLevel)
			level.queue_free()
			level = nextLevel

func _start_level(levelPath):
	nextLevel = load(levelPath).instance()
	LevelOpening._set_message(nextLevel.mensagem)
	LevelOpening.visible=true
	level.queue_free()
	yield(get_tree().create_timer(2.0), "timeout")
	add_child(nextLevel)
	level = nextLevel
	level.connect("level_change", self, "_on_level_change")
	LevelOpening.visible=false

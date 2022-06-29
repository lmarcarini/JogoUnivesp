extends Node


var level
var nextLevel
var LevelOpening
var audioPlayer
var levelsArray = [
	"res://scenes/levels/ScoopPoop/ScoopPoop.tscn",
	"res://scenes/levels/Level_ColocarMascara/Level_ColocarMascara.tscn",
	"res://scenes/levels/Level_TirarLixo/Level_TirarLixo.tscn",
	"res://scenes/levels/Level_PassarAlcool/PassarAlcool.tscn",
	"res://scenes/levels/SitOnChair/SitOnChair.tscn"
]

func _ready():
	#levelsArray.shuffle()
	level = get_node("Level")
	LevelOpening = get_node("LevelOpening")
	audioPlayer = get_node("AudioStreamPlayer")
	level.connect("level_change", self, "_on_level_change")
	
	
func _on_level_change(level_name):
	print("Start transition")
	print(level_name)
	match level_name:
		"start":
			audioPlayer.play()
			_start_level(levelsArray.pop_front())
		"success":
			if levelsArray.size() == 0:
				_on_zeramento()
			else:
				_start_level(levelsArray.pop_front())
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

func _on_zeramento():
	nextLevel = load("res://scenes/GameOver/GameOver.tscn").instance()
	add_child(nextLevel)
	level.queue_free()
	level = nextLevel

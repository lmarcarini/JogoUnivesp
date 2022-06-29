extends Node


var level
var nextLevel
var LevelOpening
var audioPlayer
const allLevels = [
	"res://scenes/levels/ScoopPoop/ScoopPoop.tscn",
	"res://scenes/levels/Level_ColocarMascara/Level_ColocarMascara.tscn",
	"res://scenes/levels/Level_TirarLixo/Level_TirarLixo.tscn",
	"res://scenes/levels/Level_PassarAlcool/PassarAlcool.tscn",
	"res://scenes/levels/SitOnChair/SitOnChair.tscn"
]
var levelsArray
var gameoverMusic = preload("res://assets/music/haunted-by-the-past-113486.mp3")
var victoryMusic = preload("res://assets/music/the-victory-is-one-for-all-15302.mp3")
var playingMusic = preload("res://assets/music/Slapstick.mp3")

func _ready():
	levelsArray = allLevels.duplicate()
	levelsArray.shuffle()
	level = get_node("Level")
	LevelOpening = get_node("LevelOpening")
	audioPlayer = get_node("AudioStreamPlayer")
	level.connect("level_change", self, "_on_level_change")
	
func restart():
	levelsArray = allLevels.duplicate()
	levelsArray.shuffle()
	audioPlayer.set_stream(playingMusic)
	audioPlayer.play()
	_on_level_change("success")
	
func _on_level_change(outcome):
	match outcome:
		"start":
			audioPlayer.play()
			_start_level(levelsArray.pop_front())
		"success":
			if levelsArray.size() == 0:
				_on_zeramento()
			else:
				_start_level(levelsArray.pop_front())
		"gameover":
			_on_gameover()

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

func _on_gameover():
	nextLevel = load("res://scenes/GameOver/GameOver.tscn").instance()
	add_child(nextLevel)
	level.queue_free()
	level = nextLevel
	audioPlayer.set_stream(gameoverMusic)
	audioPlayer.play()

func _on_zeramento():
	nextLevel = load("res://scenes/Success/SuccessScreen.tscn").instance()
	add_child(nextLevel)
	level.queue_free()
	level = nextLevel
	audioPlayer.set_stream(victoryMusic)
	audioPlayer.play()

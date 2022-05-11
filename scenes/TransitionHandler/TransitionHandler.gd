extends Node


var level
var nextLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_node("Level")
	level.connect("level_change", self, "_on_level_change")
	pass # Replace with function body.
	
	
func _on_level_change(level_name):
	print("Start transition")
	print(level_name)
	match level_name:
		"start":
			nextLevel = load("res://scenes/level_experimental/level_experimental.tscn").instance()
			add_child(nextLevel)
			level.queue_free()
			level = nextLevel
			level.connect("level_change", self, "_on_level_change")
		"gameover":
			nextLevel = load("res://scenes/GameOver/GameOver.tscn").instance()
			add_child(nextLevel)
			level.queue_free()
			level = nextLevel

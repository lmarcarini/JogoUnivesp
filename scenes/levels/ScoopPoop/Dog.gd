extends Node2D


var poopTimer
var poopNode = preload("./Poop.tscn")
var poopCount = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	poopTimer = get_node("PoopTimer")
	poopTimer.start();


func _on_PoopTimer_timeout():
	if poopCount == 0:
		return
	var poop = poopNode.instance()
	poop.position = position + Vector2(120,80)
	get_parent().add_child(poop)
	poopCount -= 1
	poopTimer.start()

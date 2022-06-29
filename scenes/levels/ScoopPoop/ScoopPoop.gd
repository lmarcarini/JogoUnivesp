extends "res://scenes/levels/Level/Level.gd"

var mensagem = "Cate a caca"

var dog

func _ready():
	dog = get_node("Dog")

func _process(delta):
	if dog.poopCount == 0 \
	and get_tree().get_nodes_in_group("poop").size() == 0:
		_on_success()

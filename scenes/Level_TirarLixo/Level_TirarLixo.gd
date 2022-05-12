extends Node2D

signal level_change

var mensagem = "Não deixe água parada!"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_check_win_condition()

func _check_win_condition():
	var lixos = get_tree().get_nodes_in_group("Lixo")
	if(lixos.size()==0):
		_on_success()

func _on_gameover():
	print("gameover")
	emit_signal("level_change","gameover")

func _on_success():
	print("success")
	emit_signal("level_change","success")

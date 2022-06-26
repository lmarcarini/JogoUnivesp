extends "res://scenes/levels/Level/Level.gd"

var mensagem = "Não deixe água parada!"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(_check_win_condition()):
		_on_success()

func _check_win_condition() -> bool:
	var lixos = get_tree().get_nodes_in_group("Lixo")
	return \
	currentState==State.PLAYING and \
	lixos.size()==0

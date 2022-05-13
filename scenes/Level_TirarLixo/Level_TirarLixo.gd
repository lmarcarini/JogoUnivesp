extends Node2D

signal level_change

enum State{
	PLAYING,
	GAMEOVER,
	SUCCESS
}

var currentState=State.PLAYING

var mensagem = "Não deixe água parada!"
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer=get_node("Timer")
	timer.connect("timer_ended",self,"_on_gameover")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(_check_win_condition()):
		_on_success()

func _check_win_condition() -> bool:
	var lixos = get_tree().get_nodes_in_group("Lixo")
	return \
	currentState==State.PLAYING and \
	lixos.size()==0

func _on_gameover():
	if(currentState==State.PLAYING):
		print("gameover")
		currentState=State.GAMEOVER
		emit_signal("level_change","gameover")

func _on_success():
	print("success")
	currentState=State.SUCCESS
	emit_signal("level_change","success")

extends Node2D

signal level_change

enum State{
	PLAYING,
	GAMEOVER,
	SUCCESS
}

var currentState=State.PLAYING

var timer
var mensagem_sucesso=preload("res://entities/mensagemSucesso/mensagemSucesso.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer=get_node("Timer")
	timer.connect("timer_ended",self,"_on_gameover")

func _on_gameover():
	if(currentState!=State.PLAYING):
		return
	currentState=State.GAMEOVER
	emit_signal("level_change","gameover")

func _on_success():
	if(currentState!=State.PLAYING):
		return
	currentState=State.SUCCESS
	add_child(mensagem_sucesso.instance())
	timer.queue_free()
	yield(get_tree().create_timer(1.5), "timeout")
	emit_signal("level_change","success")

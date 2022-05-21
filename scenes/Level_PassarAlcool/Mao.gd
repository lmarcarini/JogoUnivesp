extends Node2D


const RIGHT_BORDER =  930
const LEFT_BORDER = 99

const Velocidade = 400

var Dirx = +1


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	translate(Vector2(Dirx,0) * Velocidade * delta)
	global_position.x = clamp(global_position.x, LEFT_BORDER , RIGHT_BORDER)
	
	if global_position.x >= 930:
		Dirx = -1
	if global_position.x <= 99:
		Dirx = +1
	pass

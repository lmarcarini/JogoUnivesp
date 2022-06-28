extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Velocidade = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var Diry = +1
	
	translate(Vector2(0, Diry) * Velocidade * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	if (area.get_parent().name == "Mao"):
		get_parent()._on_success()

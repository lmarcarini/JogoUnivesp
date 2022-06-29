extends Node2D


var move_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(move_speed,0))


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		queue_free()

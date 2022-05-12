extends Area2D

enum State {
	IDLE,
	GRABBED
}

var current_state = State.IDLE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Agarrei")
		current_state=State.GRABBED
	else:
		current_state=State.IDLE
		print("Solto")

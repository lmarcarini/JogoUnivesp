extends Node2D

enum State {
	IDLE,
	GRABBED
}

var current_state = State.IDLE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(current_state==State.GRABBED):
		position = get_global_mouse_position()
	pass

func _on_Area2D_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Agarrei")
		current_state=State.GRABBED
	

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and !event.pressed:
		print("Soltei")
		current_state=State.IDLE

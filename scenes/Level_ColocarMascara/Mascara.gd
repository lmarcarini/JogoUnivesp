extends Node2D

enum State {
	IDLE,
	GRABBED,
	ON_FACE
}

var current_state = State.IDLE

var off_face_shape = preload("res://scenes/Level_ColocarMascara/collision_shape_idle.tres")
var on_face_shape = preload("res://scenes/Level_ColocarMascara/collision_shape_on_face.tres")
var rectangle_placeholder

# Called when the node enters the scene tree for the first time.
func _ready():
	rectangle_placeholder = get_node("ColorRect")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(current_state==State.GRABBED):
		position = get_global_mouse_position()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Agarrei")
		current_state=State.GRABBED
		_exit_face()

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and !event.pressed \
	and current_state !=State.ON_FACE:
		print("Soltei")
		current_state=State.IDLE
		_exit_face()

func _enter_on_face():
	current_state = State.ON_FACE
	get_node("Area2D/CollisionShape2D").shape = on_face_shape
	rectangle_placeholder.margin_right=287

func _exit_face():
	get_node("Area2D/CollisionShape2D").shape = off_face_shape
	rectangle_placeholder.margin_right=40

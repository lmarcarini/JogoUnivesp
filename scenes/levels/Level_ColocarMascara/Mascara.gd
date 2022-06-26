extends Node2D

enum State {
	IDLE,
	GRABBED,
	ON_FACE
}

var current_state = State.IDLE

var rostoNode

var off_face_shape = preload("./collision_shape_idle.tres")
var on_face_shape = preload("./collision_shape_on_face.tres")
var rectangle_placeholder

# Called when the node enters the scene tree for the first time.
func _ready():
	rostoNode = get_parent().get_node("Rosto")
	rectangle_placeholder = get_node("ColorRect")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(current_state==State.GRABBED):
		position = get_global_mouse_position()

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		print("Agarrei")
		current_state=State.GRABBED
		_enter_grabbed()

func _input(event):
	if current_state == State.GRABBED:
		if event is InputEventMouseButton \
		and event.button_index == BUTTON_LEFT \
		and !event.pressed:
			print("Soltei")
			if (rostoNode._is_on_face(event.position)):
				_enter_on_face()
				if (rostoNode._is_covering_mouth_and_nose(event.position)):
					get_parent()._on_success()
			else:
				current_state=State.IDLE
				_enter_grabbed()

func _enter_on_face():
	current_state = State.ON_FACE
	position.x = rostoNode.position.x
	#get_node("Area2D/CollisionShape2D").shape = on_face_shape
	get_node("Area2D/CollisionShape2D").visible = false
	get_node("Area2D/CollisionOnFace").visible = true
	rectangle_placeholder.margin_right=288

func _enter_grabbed():
	#get_node("Area2D/CollisionShape2D").shape = off_face_shape
	get_node("Area2D/CollisionShape2D").visible = true
	get_node("Area2D/CollisionOnFace").visible = false
	rectangle_placeholder.margin_right=40

extends Node2D


const FACE_HEIGHT = 360
const FACE_WIDE = 287

var mascara

# Called when the node enters the scene tree for the first time.
func _ready():
	mascara = get_parent().get_node("Mascara")


func _on_Area2D_input_event(viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and !event.pressed:
		var relative_position=_get_relative_position(viewport.get_mouse_position())
		if(_is_on_face(relative_position)):
			mascara._enter_on_face()
			mascara.position.x = position.x

func _get_relative_position(mouse_position):
	return (mouse_position-position)

func _is_on_face(relative_position):
	print(relative_position)
	return (relative_position.x>0 and relative_position.x<FACE_WIDE) \
	and ((relative_position.y>0 and relative_position.x<FACE_HEIGHT))

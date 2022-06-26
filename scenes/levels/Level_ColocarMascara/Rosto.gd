extends Node2D


const FACE_HEIGHT = 360
const FACE_WIDTH = 287

var mascara

# Called when the node enters the scene tree for the first time.
func _ready():
	mascara = get_parent().get_node("Mascara")

func _get_relative_position(mouse_position):
	return (mouse_position-position)

func _is_on_face(mouse_position):
	var relative_position=_get_relative_position(mouse_position)
	return (relative_position.x>0 and relative_position.x<FACE_WIDTH) \
	and ((relative_position.y>0 and relative_position.y<FACE_HEIGHT))

func _is_covering_mouth_and_nose(mouse_position):
	var relative_position=_get_relative_position(mouse_position)
	return ((relative_position.y>100 and relative_position.y<200))

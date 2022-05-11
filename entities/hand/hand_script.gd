extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func move_hand():
	self.position = get_viewport().get_mouse_position()
	
func _process(_delta):
	move_hand()

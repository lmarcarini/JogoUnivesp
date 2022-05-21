extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PRE_gota = preload("res://scenes/Level_PassarAlcool/Gota.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
	#if Input.is_action_just_pressed("ui_accept"):
		if (get_tree().get_nodes_in_group("gotas").size() <= 3):
			var gota = PRE_gota.instance()
			get_parent().add_child(gota)
			gota.global_position = $Area2D/Bico.global_position
		pass

extends Node2D


var pressable = true
const PRE_gota = preload("./Gota.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if(pressable):
			pressable = false
			var gota = PRE_gota.instance()
			get_parent().add_child(gota)
			gota.global_position = $Area2D/Bico.global_position
			yield(get_tree().create_timer(0.5), "timeout")
			pressable = true

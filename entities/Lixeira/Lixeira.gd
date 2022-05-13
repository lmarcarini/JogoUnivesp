extends Node2D


var animation


# Called when the node enters the scene tree for the first time.
func _ready():
	animation = get_node("AnimationPlayer")
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	var parentNode=area.get_parent()
	if(parentNode.is_in_group("Lixo")):
		parentNode.queue_free()
		animation.play("Lixo Jogado")

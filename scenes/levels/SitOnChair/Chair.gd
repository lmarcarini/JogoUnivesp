extends Node2D

export(String, "Empty", "Occupied", "Success") var type : String


func _ready():
	if (type == "Occupied"):
		get_node("Person").visible=true

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
		and event.button_index == BUTTON_LEFT \
		and event.pressed:
			get_parent().get_node("PersonWaiting").position.x=position.x+30
			get_parent().get_node("PersonWaiting").position.y=position.y+30
	if type=="Success":
		if event is InputEventMouseButton \
		and event.button_index == BUTTON_LEFT \
		and event.pressed:
			print("Button")
			get_parent()._on_success()

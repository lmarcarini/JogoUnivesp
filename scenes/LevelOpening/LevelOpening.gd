extends Node2D


var message = "placeholder"
var textLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	textLabel = get_node("RichTextLabel")
	_set_message(message)

func _set_message(msg):
	textLabel.bbcode_text = "[center]"+msg

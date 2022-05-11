extends Control

signal timer_ended

var timerSprite
export(int) var duration=1


# Called when the node enters the scene tree for the first time.
func _ready():
	timerSprite= get_node("TimerSprite");
	timerSprite.get_sprite_frames().set_animation_speed("countdown", 1.0/duration)
	timerSprite.connect("animation_finished",self,"_on_animation_finished")
	timerSprite.playing=true
	pass # Replace with function body.


func _on_animation_finished():
	emit_signal("timer_ended")

extends Sprite

var move_speed = 5

func _process(delta):
	translate(Vector2(move_speed,0))

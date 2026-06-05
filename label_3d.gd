extends Label3D

var speed = 1.0

func _process(delta):
	position.x += speed * delta

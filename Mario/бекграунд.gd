extends ParallaxBackground

var speedbg = 69


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= speedbg * delta

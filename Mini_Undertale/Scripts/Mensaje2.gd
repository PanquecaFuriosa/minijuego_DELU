extends Label
var seg = 0

func _process(delta):
	if seg < 8:
		seg += delta
	elif not(self.get_child(0).is_playing()) and seg >= 8:
		self.get_child(0).play("Mensaje2")
	else:
		seg += delta
	if seg >= 23:
		self.queue_free()

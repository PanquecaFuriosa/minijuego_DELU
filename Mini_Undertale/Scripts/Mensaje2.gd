extends Label
var seg = 0

func _ready():
	yield(get_tree().create_timer(7),'timeout')
	self.get_child(0).play("Mensaje2")
	yield(get_tree().create_timer(15),'timeout')
	self.queue_free()

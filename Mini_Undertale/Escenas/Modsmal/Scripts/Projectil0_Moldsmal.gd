extends Area2D

export var velocity  = 50
var direction = Vector2.RIGHT
export(int) var damage :int = 5

func _process(delta):
	position += direction * delta * velocity
	
var first_impact = true

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		self.call_deferred('queue_free')
		body.get_node('Health').Health_Update(damage)
	else:
		queue_free()

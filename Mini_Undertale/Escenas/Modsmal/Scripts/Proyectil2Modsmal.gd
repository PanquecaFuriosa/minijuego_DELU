extends Area2D

export(int) var damage :int = 5
export var velocity = 100
onready var timer = $"Timer"
var direction = Vector2.RIGHT.rotated(PI/3)
 

func _process(delta):
	position  += direction * velocity * delta

func _on_Timer_timeout():
	direction.x = -direction.x
	timer.start()

var first_impact = true

func _on_Proyectil2_Modsmal_body_entered(body):
	if first_impact:
		first_impact = false
		pass
	else:
		if body.name == "Player":
			self.call_deferred('queue_free')
			body.get_node('Health').Health_Update(damage)
		else:
			self.call_deferred('queue_free')

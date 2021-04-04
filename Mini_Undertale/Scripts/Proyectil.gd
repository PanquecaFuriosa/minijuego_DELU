extends Area2D
export var velocidad = 70
var trayecto :Vector2 = Vector2.ZERO
export(int) var damage :int = 5
var c = 0
#func elegir_trayectoria():
#	if get_rotation_degrees() > -5 and get_rotation_degrees() < 5:
#		trayecto = Vector2.UP * velocidad
#	elif get_rotation_degrees() > 175 and get_rotation_degrees() < 185:
#		trayecto = Vector2.DOWN * velocidad
#	elif get_rotation_degrees() > -95 and get_rotation_degrees() < -85:
#		trayecto = Vector2.LEFT * velocidad
#	else:
#		trayecto = Vector2.RIGHT * velocidad
	#trayecto = trayecto.normalized()

func _process(delta):
	if c < 2:
		trayecto = (get_node("/root/Fightscene/Player").get_global_position() - self.get_global_position())
		trayecto = trayecto.normalized()
		translate(trayecto * delta * velocidad)
		c += delta
	elif c >= 2 and c < 4:
		c += delta
	else:
		trayecto = (get_node("/root/Fightscene/Player").get_global_position() - self.get_global_position())
		trayecto = trayecto.normalized()
		translate(trayecto * delta * velocidad)
		c += delta 
		

func _on_Proyectil_body_entered(body):
	self.call_deferred('queue_free')
	body.get_node('Health').Health_Update(damage)
	
	

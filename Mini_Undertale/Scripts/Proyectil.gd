extends Area2D
export var velocidad = 500
var trayecto = Vector2.ZERO

func elegir_trayectoria():
	if get_rotation_degrees() > -5 and get_rotation_degrees() < 5:
		trayecto = Vector2.UP * velocidad
	elif get_rotation_degrees() > 175 and get_rotation_degrees() < 185:
		trayecto = Vector2.DOWN * velocidad
	elif get_rotation_degrees() > -95 and get_rotation_degrees() < -85:
		trayecto = Vector2.LEFT * velocidad
	else:
		trayecto = Vector2.RIGHT * velocidad

func _process(delta):
	translate(trayecto * delta)

func _on_Proyectil_body_entered(body):
	self.queue_free()

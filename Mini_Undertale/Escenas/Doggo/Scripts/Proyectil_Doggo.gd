extends "res://Escenas/Modsmal/Scripts/Projectil0_Moldsmal.gd"

onready var tween :Tween = $Tween #The floor here is made out of floor
export(Vector2) var distance : Vector2 = Vector2(-256,0)
export(float) var duration :float = 4.0

onready var placement = get_parent().get_node('Commander/Spawner0').get_global_position()

signal tween_completed

#Señal para detección/no detección de movimiento
signal movement(detected)

func _ready():
	set_process(false)
	
	tween.interpolate_property(self, "position",
		placement,placement + distance, duration,
		Tween.TRANS_QUAD, Tween.EASE_OUT_IN)
	tween.start()
	
	

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#TEMPORAL. Lo ideal seria que la hitbox del corazon fuera la que se deshabilite por un tiempo, pero xd.
		self.get_node("CollisionShape2D").set_deferred('disabled',true)
		
		if body.get_node('Movement').direction != Vector2(0,0):
			body.get_node('Health').Health_Update(damage)
			emit_signal('movement',true)
		else:
			emit_signal('movement',false)

	else:
		queue_free()


func _on_Tween_tween_completed(object, key):
	emit_signal("tween_completed")

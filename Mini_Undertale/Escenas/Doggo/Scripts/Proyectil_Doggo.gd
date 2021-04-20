extends "res://Escenas/Modsmal/Scripts/Projectil0_Moldsmal.gd"

onready var tween :Tween = $Tween #The floor here is made out of floor
export(float) var distance : float = 256
export(float) var duration :float = 4.0

func _ready():
	set_process(false)
	tween.interpolate_property(self, "position",
		get_global_position(), get_global_position() + direction*distance, duration,
		Tween.TRANS_QUAD, Tween.EASE_OUT_IN)
	tween.start()

	

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#TEMPORAL. Lo ideal seria que la hitbox del corazon fuera la que se deshabilite por un tiempo, pero xd.
		self.get_node("CollisionShape2D").set_deferred('disabled',true)
		body.get_node('Health').Health_Update(damage)
	else:
		queue_free()

extends Node2D
signal die()

onready var player = get_parent()
var max_hp :int = PlayerVariables.max_hp
var current_hp :int = PlayerVariables.current_hp

#señal para la GUI
signal Update_Health()

#función de recibir/curar daño
func Health_Update(value):

	#cambia el valor de la vida, el minimo es 0 y el máximo es max_hp
	current_hp = min(max(0, current_hp - value),max_hp)
	#actualiza el singleton y envia la señal
	PlayerVariables.current_hp = current_hp
	emit_signal("Update_Health")
	get_parent().get_parent().get_node("Hurt").play()
	yield(get_tree().create_timer(0.59), "timeout")
	get_parent().get_parent().get_node("Hurt").stop()
	
	if current_hp == 0:
		Die()

func Die():
	#Desactivar hitbox
	player.get_node("CollisionShape2D").set_deferred('disabled',true)
	
	#Desactivar movimiento
	player.get_node("Movement").set_physics_process(false)
	
	#Aqui seria la transicion a la escena GAME OVER
	emit_signal("die")

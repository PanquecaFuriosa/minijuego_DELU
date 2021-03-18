extends Node2D

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
	
	if current_hp == 0:
		Die()

func Die():
	#Desactivar hitbox
	player.get_node("CollisionShape2D").set_deferred('disabled',true)
	
	#Desactivar movimiento
	player.get_node("Movement").set_physics_process(false)
	
	#Aqui seria la transicion a la escena GAME OVER

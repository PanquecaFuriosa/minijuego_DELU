extends "res://Escenas/GUI/ActPanel.gd"

var player_moved :bool = true
var spared :bool = false

var first_turn :bool = true

var spare_counter :int = 0

signal not_spared_anymore

#Lo mismo que la anterior, pero no cambia los botones de perdonar (aka no esta conectada a Selection ni a MercyPanel)
#En los demas nodos activa la misma funcion
signal enough_pet


func _ready():
	._ready()
	enemy_name = "Doggo"
	encounter_dialog = "* Doggo Blocks the way!"
	
	set_neutral_state(["* Doggo is too suspicious of your movements."], ["current"], false)
	set_spare_state(["* Doggo has been pet."], ["current"])
	
	#Si te moviste en el turno anterior de Doggo
	set_new_state("After_moving", ["* Doggo is confirming the moving object."], ["current"], false)
	
	#Si no
	set_new_state("After_not_moving", ["* Doggo can't seem to find anything."], ["current"], false)
	
	#Estados cuando lleva x turnos seguidos donde lo puedes perdonar (se supone que en todos esos turnos le diste a Pet pero XD)
	#Esto es solo para cambiar los dialogos, creo que se hizo una mejor forma de hacer eso pero no c y Marco esta muerto a esta hora y tengo que entregar esto en la mañana nps
	#0 es el estado de spare por default
	
	set_new_state("Spared_1",["* Doggo has been pet."], ["current"], true)
	set_new_state("Spared_2",["* Doggo has been pet."], ["current"], true)
	set_new_state("Spared_3",["* Doggo has been pet."], ["current"], true)
	set_new_state("Spared_4",["* Doggo has been pet."], ["current"], true)
	
	play_state(states.get("neutral")) 
	set_spare_requirement("Pet", 1)

func spare_requirement(interaction, times_pressed): 

	if spared:
		spare_counter = spare_counter + 1
		if player_moved:
			spare_check()
		else:
			switch_spare_state()
	
	else:
		if not first_turn:
			if interactions.get(interaction).has("times_pressed") and not player_moved: #ve si esta la interaccion que toma como argumento en donde se almacenan las interacciones y verifica si se ha presionado antes
			
				if interactions.get(interaction)["times_pressed"] >= times_pressed: #si se ha presionado antes, entonces compara las veces con las veces del arguemento
					#can_be_spared() #Esta linea es redundante considerando lo que hace la funcion de abajo. Chequear en ActPanel.gd
					play_state(states["spare"]) #y corre el estado de spare. Esta funcion es llamada cada vez que inicia un turno
					#Cambiar esto si hay alguna otra forma de saber si se puede perdonar o no.
					spared = true
			
			elif player_moved:
				play_state(states.get("After_moving")) 
			else:
				play_state(states.get("After_not_moving")) 
			
				
		else:
			first_turn = false

#Si ya se puede perdonar, chequea esto para ver si todavia se puede perdonar despues del turno anterior
func spare_check():
	#Si no se movio, to bien, y si se movió...
		#Ya no puede ser perdonado
		not_be_spared()
		#Vuelve al estado neutral
		play_state(states.get("neutral"))
		spared = false
		spare_counter = 0

		
func not_be_spared():
	emit_signal("not_spared_anymore")
	
func switch_spare_state():
	#Aqui hay un bug. Cada vez que se activa un stado donde se puede perdonar, se crea un nuevo dialogo PET.
	#Esto pasa porque cada vez que corre play_state se emite una señal que activa un patron para que estos dialogos aparezcan
	#Pero lo dejé así porque está kul :v (y se evitaria si supiera como cambiar los dialogos sin cambiar el state)
	match spare_counter:
		1:
			play_state(states.get("Spared_1")) 
		2:
			play_state(states.get("Spared_2"))
		3:
			play_state(states.get("Spared_3"))
		4:
			play_state(states.get("Spared_4"))
			emit_signal("enough_pet")   #Todavia estará en spare, pero no actuará como tal e.e
		
	print("van "+ str(spare_counter)+ " turnos.")

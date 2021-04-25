extends "res://Escenas/GUI/ActPanel.gd"

var player_moved :bool = true
var spared :bool = false

var first_turn :bool = true

var spare_counter :int = 0

signal not_spared_anymore


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
	
	
	
	
	play_state(states.get("neutral")) 
	set_spare_requirement("Pet", 1)

func spare_requirement(interaction, times_pressed): 

	if spared:
		spare_counter = spare_counter + 1
		spare_check()
	
	else:
		if interactions.get(interaction).has("times_pressed") and not player_moved and not first_turn: #ve si esta la interaccion que toma como argumento en donde se almacenan las interacciones y verifica si se ha presionado antes
			
			if interactions.get(interaction)["times_pressed"] >= times_pressed: #si se ha presionado antes, entonces compara las veces con las veces del arguemento
				#can_be_spared() #Esta linea es redundante considerando lo que hace la funcion de abajo. Chequear en ActPanel.gd
				play_state(states["spare"]) #y corre el estado de spare. Esta funcion es llamada cada vez que inicia un turno
				#Cambiar esto si hay alguna otra forma de saber si se puede perdonar o no.
				spared = true
			
		elif player_moved:
			play_state(states.get("After_moving")) 
		else:
			play_state(states.get("After_not_moving")) 
			
				
	if first_turn:
		first_turn = false
#Si ya se puede perdonar, chequea esto para ver si todavia se puede perdonar despues del turno anterior
func spare_check():
	#Si no se movio, to bien, y si se movió...
	if player_moved:
		#Ya no puede ser perdonado
		not_be_spared()
		#Vuelve al estado neutral
		play_state(states.get("neutral"))
		spared = false
		spare_counter = 0
		
func not_be_spared():
	emit_signal("not_spared_anymore")

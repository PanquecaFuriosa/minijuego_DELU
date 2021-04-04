extends "res://Escenas/GUI/GenericPanel3.gd"

signal it_can_be_spared()


onready var dialog_panel = get_parent().get_node("Dialogo")
var rng = RandomNumberGenerator.new()

#aqui se almacenan los dialogos para cada boton en el panel de act
var dialog1_c1
var dialog2_c1
var dialog3_c1
var dialog1_c2
var dialog2_c2
var dialog3_c2

var enemy_name: String
var enemy_atk = "69"
var enemy_def = "420"


var encounter_dialog

var start_dialogs_stage #variable para pasarle a la caja de dialogo al comienzo de cada turno que dialogo se va a mostrar


var interactions = {} #aqui se almacenan todas las interacciones con su posicion y el dialogo que desencadenan



var states = {} #aqui se almacenan los estados de enemigos, puedes configurarlos con set_new_state, set_spare_state y set_neutral_state
#la sintaxis es
#	state_name : {
#		"start_dialogs": ["dialogos al comienzo de turno", "dialogos al comienzo de turno", "dialogos al comienzo de turno", ...]
#		"interaction_dialogs":  {
#			"interaction": opcion en act que va a cambiar su dialogo por defecto,
#			"new_dialog": nuevo dialogo xd
#			}
#		"can_be_spared": true o false
#		}


#almacenamiento de requisitos para perdonar
var spare_interaction
var times_needed

func _ready():
	rng.randomize()
	get_parent().connect("player_turn_started", self, "at_turn_beginning") #para cambiar el dialogo al comienzo del turno
	
	#asi se configura un enemigo
	encounter_dialog = "Moldsmal blocked the way!" #esto es lo que primero aparece cuando entra en batalla
	#esto es para configurar los estados
	#a los estados les pasas 3 argumentos 
		#1: los dialogos que aparecen al comienzo de turno estando en ese dialogo, si el state no lo cambia le pasas ["current"]
		#2: si cambian alguna interaccion (osea el dialogo que aparece al darle a alguna opcion en act),  si el state no cambia ninguno le pasas ["current"]
		#3: si en ese estado se puede perdonar. En la funcion set_spare_state solo le pasas los primeros dos argumentos por que pues, obviamente, se puede perdonar
	set_neutral_state(["Moldsmal waits pensively.", "Moldsmal burbles quietly.", "Moldsmal is ruminating.", "The aroma of lime gelatin wafts through."], ["current"], false)
	set_spare_state(["Moldsmal is happy now"], ["current"])
	#si quieres añadir nuevos estados lo puedes hacer con set_new_state()
	
	#y por ultimo le dices en cual estado entra en la escena, en este caso el neutral 
	play_state(states.get("neutral")) 
	set_spare_requirement("Flirt", 1) #y el requisito para perdonarlo. de momento se usa esta funcion que 
										#toma el boton que hay que presionar para perdonarlo y cuantas veces hay que presionarlo
										#estaba trabajando en otra funcion que mejore esto pero se me fue de las manos asi que de momento esto.
	#antes de configurar todo esto hay que pasarles las opciones de act en el menu.gd con alguna de las funciones act_option()
	
	
	


#asigna el dialogo del argumento al boton ubicado en x fila en y en x columna
func set_dialog(row,column,dialog):
	if column == 1:
		match row:
			1:
				dialog1_c1 = dialog
			2:
				dialog2_c1 = dialog
			3: 
				dialog3_c1 = dialog
	elif column == 2:
		match row:
			1:
				dialog1_c2 = dialog
			2:
				dialog2_c2 = dialog
			3: 
				dialog3_c2 = dialog

func set_start_dialogs(new_start_dialogs: Array):
	start_dialogs_stage = new_start_dialogs #esta funcion solo es usada en play_state

func change_response(interaction, new_response):
	set_dialog(interactions.get(interaction)["row"], interactions.get(interaction)["column"], new_response)
	#esto es para cambiar dialogos ya establecidos con la funcion add_option



func set_spare_requirement(interaction,times_pressed): #setea las variables que
													#seran llamadas con spare_requirement cada vez que se inicie un turno
	spare_interaction = interaction
	times_needed = times_pressed

func spare_requirement(interaction, times_pressed): 
	if interactions.get(interaction).has("times_pressed"): #ve si esta la interaccion que toma como argumento en donde se almacenan las interacciones y verifica si se ha presionado antes
		if interactions.get(interaction)["times_pressed"] >= times_pressed: #si se ha presionado antes, entonces compara las veces con las veces del arguemento
			can_be_spared()
			play_state(states["spare"]) #y corre el estado de spare. Esta funcion es llamada cada vez que inicia un turno

	
##AQUI EMPIEZAN LAS HEREJIAS MAS GRANDES EN LA HISTORIA DEL ANIME Y NO ESTAN TERMIANDAS##

#func set_new_new_spare_requirement(spare_interaction, state_triggered):
#	spare_argument = [spare_interaction, state_triggered]
#
##func set_spare_requirement(interaction, state_triggered):
##	spare_interaction = interaction
##	times_needed = times_pressed  
#
#var botones_presionados 
#
#var steps_passed = []
#
#func new_new_spare_requirement( steps ):  #= [[botones_que_debes_presionar, estado_que_desencadena], [botones_que_debes_presionar, estado_que_desencadena]]
#	for i in steps:
#		steps_passed.append(false)
#	for i in range(len(steps) - 1):
#		if steps_passed[i] == false:
#			for j in steps[i]: 
#				for button in steps[i][i]:
#					if interactions.has(button) and interactions.get(button).times_pressed >= 1:
#						steps_passed[i] = true
#						break
#				if steps_passed[i] == true:
#					play_state(states.get(steps[i][j]))
#
#
##func new_spare_requirement( steps = [{"botones_que_debes_presionar": botones ,  "estado_que_desencadena": estado}]):
##
##	for i in range(len(steps) - 1):
##		steps_passed.append(false) #añade la cantidad de "interruptores" que hay que pasar para llegar al perdon de kirby
##	for i in range(len(steps) - 1): #itera por los pasos para perdonarlo
##		var breakable = false #para salir del siguiente loop 
##		if steps_passed[i] == false: #checkea si se ha presionado alguno de los botones necesarios para pasar al siguiente paso
##			for buttons in steps[i]["butones_que_debes_presionar"]: #por cada boton o interaccion señalada en el argumento
##				if not breakable:
##					var interaction_pressed = interactions.get(buttons)["times_pressed"]  #buscala en las interacciones que hay en el panel act 
##					if interaction_pressed >= 1: # verifica si alguna de ellas ha sido presionada
##						steps_passed[i] = true  #si es asi se puede pasar al siguiente paso
##						breakable = true 
##						search_state(steps[i]["estado_que_desencadena"])
##				else:
##					break
##		else:
##			break
#

##################Y AQUI TERMINAN #################

####FUNCIONES SETTERS DE STATES######

func set_neutral_state(start_dialogs, interaction_dialogs, can_be_spared):
	states["neutral"] = {
		"start_dialogs": start_dialogs,
		"interaction_dialogs": interaction_dialogs,
		"can_be_spared": can_be_spared
		}

func set_spare_state(start_dialogs, interaction_dialogs):
	states["spare"] = {
		"start_dialogs": start_dialogs,
		"interaction_dialogs": interaction_dialogs,
		"can_be_spared": true
		}

func set_new_state(state_name, start_dialogs, interaction_dialogs, can_be_spared):
	if states.has(state_name):
		states.erase(state_name)
	states[state_name] = {
			
			"start_dialogs": start_dialogs,
			"interaction_dialogs" : interaction_dialogs,
			"can_be_spared": can_be_spared
			
			}
###############################



func play_state(state):


	if state["start_dialogs"][0] != "current":
		#set_start_dialogs(state.start_dialogs[rng.randi_range(0, len(state.start_dialogs) - 1)])
		start_dialogs_stage = state["start_dialogs"] #almacena los dialogos del state del argumento para luego ser llamados aleatoriamente al comienzo del turno
	if state["interaction_dialogs"][0] != "current":
		change_response(state.interaction_dialogs["interaction"], state.interaction_dialogs["new_interaction"]) #esto para cambiar la respuesta por default de algun boton que se mencione en el state
	if state["can_be_spared"]:
		can_be_spared()
	


func at_turn_beginning():
	spare_requirement(spare_interaction,times_needed)
	dialog_panel.change_dialog(start_dialogs_stage[rng.randi_range(0, len(start_dialogs_stage) - 1)])


func can_be_spared():
	emit_signal("it_can_be_spared")

#esto se encarga de escuchar si el jugador presiono alguno de los botones y asi cambiar el dialogo al dialogo de dicho boton
func button1_pressed():
	.button1_pressed()
	dialog_panel.change_dialog(
		"* " + enemy_name.to_upper() + " " + enemy_atk + " ATK " + enemy_def + " DEF" + """
		""" + "* " + dialog1_c1
		)  ##como el boton 1 es siempre el check, entonces aqui se configura el dialogo de check
	
	var button_interaction = button1.get_node("Label").text.right(2) #obten el nombre de la interaccion
	if interactions.has(button_interaction): #verifica si esa interaccion esta almacenada en las interacciones
		if interactions.get(button_interaction).has("times_pressed"): #si lo esta, verifica si tiene la key times_pressed
			interactions.get(button_interaction)["times_pressed"] += 1 #si la tiene entonces sumale una vez a las veces presinado
		else:
			interactions.get(button_interaction)["times_pressed"] = 1 #si no la tiene significa que no ha sido presionado antes asi que añadele 1
	
func button2_pressed():
	.button2_pressed()
	dialog_panel.change_dialog(dialog2_c1)
	var button_interaction = button2.get_node("Label").text.right(2)
	if interactions.has(button_interaction):
		if interactions.get(button_interaction).has("times_pressed"):
			interactions.get(button_interaction)["times_pressed"] += 1
		else:
			interactions.get(button_interaction)["times_pressed"] = 1
	
func button3_pressed():
	.button3_pressed()
	dialog_panel.change_dialog(dialog3_c1)
	var button_interaction = button3.get_node("Label").text.right(2)
	if interactions.has(button_interaction):
		if interactions.get(button_interaction).has("times_pressed"):
			interactions.get(button_interaction)["times_pressed"] += 1
		else:
			interactions.get(button_interaction)["times_pressed"] = 1
	
func button4_pressed():
	.button4_pressed()
	dialog_panel.change_dialog(dialog1_c2)
	var button_interaction = button4.get_node("Label").text.right(2)
	print(button_interaction)
	if interactions.has(button_interaction):
		if interactions.get(button_interaction).has("times_pressed"):
			interactions.get(button_interaction)["times_pressed"] += 1
		else:
			interactions.get(button_interaction)["times_pressed"] = 1
	
func button5_pressed():
	.button5_pressed()
	dialog_panel.change_dialog(dialog2_c2)
	var button_interaction = button5.get_node("Label").text.right(2)
	if interactions.has(button_interaction):
		if interactions.get(button_interaction).has("times_pressed"):
			interactions.get(button_interaction)["times_pressed"] += 1
		else:
			interactions.get(button_interaction)["times_pressed"] = 1
	
func button6_pressed():
	.button6_pressed()
	dialog_panel.change_dialog(dialog3_c2)
	var button_interaction = button6.get_node("Label").text.right(2)
	if interactions.has(button_interaction):
		if interactions.get(button_interaction).has("times_pressed"):
			interactions.get(button_interaction)["times_pressed"] += 1
		else:
			interactions.get(button_interaction)["times_pressed"] = 1
	

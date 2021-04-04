extends TabContainer

#muchos nodos, si alguien sabe una mejor forma de hacer esto diganme ayuda por favor esto no es un meme

onready var fight_button = get_parent().get_parent().get_parent().get_node("Buttons/FightButton")
onready var act_button = get_parent().get_parent().get_parent().get_node("Buttons/ActButton")
onready var item_button = get_parent().get_parent().get_parent().get_node("Buttons/ItemButton")
onready var mercy_button = get_parent().get_parent().get_parent().get_node("Buttons/MercyButton")


onready var panels = { 
	"act": get_node("ActPanel"), 
	"fight": get_node("FightPanel"), 
	"item": get_node("ItemPanel"), 
	"mercy": get_node("MercyPanel"),
	"selection": get_node("SelectEnemy")
	}

onready var buttons = [fight_button, act_button, item_button, mercy_button]

var current_button_pressed #esto para guardar el ultimo boton presionado al entrar en el turno del enemigo
var is_first_turn = true
var fight_ended = false

signal fight_ended()
signal player_turn_ended()
signal player_turn_started() #para enseñar el dialogo al inicio de turno

func _ready():
	panels["mercy"].connect("fight_ended", self, "end_fight")
	fight_button.grab_focus() 
	set_current_tab(4)
	#escucha una señal que es transmitida por todos los botones de todos los paneles para terminar el turno en dicho momento
	for panels in get_children():
		if panels.name != "Dialogo": #excepto por el dialogo, el no tiene botones :(
			panels.connect("menu_button_pressed", self, "turn_control")
	
	#ejemplos de como se usa esta **aun mas** maravillosa funcion
	#add_option("mushu", "fight", null)
	#add_option("doctor pepper", "item", null)
	#add_option("the souls of the damned", "item", null)
	#add_option("un peluche", "item", null)
	#add_option("there is no mercy", "mercy", null)
	#add_option("nombre del enemigo", "selection", null)
	#add_option("Flee", "mercy", null)
	#add_option_in(2, 1, "mercy", "Spare", null)

	#lo de abajo es el ejemplo de agregar opciones con sus respectivas respuestas en el panel de act una por una
	
#	add_option("check", "act", "happy waifu, happy laifu")
#	add_option("my name is giovanni giorgio", "act", "but everybody calls me, giorgio")
#	add_option("aduete", "act", "aduduaduaduaete")
#	add_option("wake me up", "act", "wake me up inside")
#	add_option("peace was never an option", "act", "el caballo se llamaba viernes")
#
	#y este es el ejemplo de agregarlas todas de una sola vez
#	add_option_page(
#		["check", "my name is giovanni giorgio", "aduete", "wake me up", "peace was never an option"], #primero las opciones
#		["happy waifu, happy laifu", "but everybody calls me, giorgio", "aduduaduaduaete", "wake me up inside", "el caballo se llamaba viernes"], #luego las respuestas al presionar cada opcion
#		"act") #y el panel
#	add_option_in(2, 1, "act", "when I was", "a young boy") 
	#add_option_page(
		#["Check", "Imitate", "Flirt"] , ["Life is difficult for this enemy.Stereotypical: Curvaceously attractive, but no brains...", "You lie immobile with Moldsmal. You feel like you understand the world a little better.", "You wiggle your hips. Moldsmal wiggles back. What a meaningful conversation!"], "act"
	#)

func at_player_turn_start():
	in_menu_mode(false) #al inicio del turno quita el modo menu y regresa el focus al boton presionado en el turno anterior y emite la funcion de comienzo de turno  para que se muestre el dialogo de ese comienzo
	if is_first_turn:  #si es el primer turno no mas ponl el focus en fight, aunque creo que esto no es necesario pero son las 4 de la mañana y no quiero romper nada
		fight_button.grab_focus()
	else:
		current_button_pressed.grab_focus()
	emit_signal("player_turn_started")
	
func end_fight():
	emit_signal("fight_ended")
	fight_ended = true

func _process(delta):
	focus_control()
	

func focus_first_item():
	get_current_tab_control().get_node("MarginContainer/HBoxContainer/VBoxContainer/Item1/mButton").grab_focus()

#Cambiar de pestaña segun el boton presionado

func change_tab(tab): #ahora no hay que poner numeritos :D
	match tab:
		"fight":
			tab = 0
		"act":
			tab = 1
		"item":
			tab = 2
		"mercy":
			tab = 3
		"dialog":
			tab = 4
		"selection":
			tab = 5
	set_current_tab(tab)
	if tab != 4:
		focus_first_item()
	in_menu_mode(true)
	
func _on_FightButton_pressed():
	change_tab("fight")

func _on_ActButton_pressed():
	change_tab("selection")

func _on_ItemButton_pressed():
	change_tab("item")

func _on_MercyButton_pressed():
	change_tab("mercy")

#control de focus
#estando en modo menu, revisa si se presiono escape y regresa el focus al boton que se presiono antes
func focus_control():

	if Input.is_action_just_pressed("ui_cancel"):
		if not fight_ended:
			if fight_button.is_pressed():
				in_menu_mode(false)
				fight_button.pressed = false
				fight_button.grab_focus()
			if act_button.is_pressed():
				in_menu_mode(false)
				act_button.pressed = false
				act_button.grab_focus()
			if item_button.is_pressed():
				in_menu_mode(false)
				item_button.pressed = false
				item_button.grab_focus()
			if mercy_button.is_pressed():
				in_menu_mode(false)
				mercy_button.set_pressed(false)
				mercy_button.grab_focus()
		else:
			pass
		

func turn_control():
	in_menu_mode(false) 
	for button in buttons: #el problema que habia antes era que al terminar 
		if button.pressed == true:   #el turno del jugador habia que deseleccionar el boton seleccionado al entrar en modo menu
			button.pressed = false
			current_button_pressed = button #aqui se almacena el boton presionado antes de terminar el turno para luego 
			is_first_turn = false           #pasarle el focus en el proximo turno
		else:
			button.pressed = false    #creo que esto tambien se puede eliminar pero ya pasaron 16 minutos desde que dije que eran las 4 de la mañana
	yield(get_tree().create_timer(2.0),"timeout") #Da un tiempo para leer el dialogo
	#Empieza el turno del enemigo 
	#visible = false
	emit_signal("player_turn_ended")


	"""
	Esta es la herejía que tenía antes, por si sirve de algo, si no sirve, quemenla xddd
	#Itera sobre todos los botones (los hijos del nodo Buttons
		for button in fight_button.get_parent().get_children():
			#Verifica que no sea un separador
			if 'Button' in button.name:
				if button.is_pressed():
					#Verifica cual opcion estaba seleccionada y haz algo acorde (p.e cambiar el dialogo)
					#WIP
					#aiuda no c como cambiar el dialogo
					
					in_menu_mode(false)
					yield(get_tree().create_timer(2.0),"timeout")
					
					#Empieza el turno del enemigo
					visible = false
					emit_signal("player_turn_ended")
		"""


func in_menu_mode(value: bool):
	#esto quita la posibilidad de que estando en algun panel el focus se vaya a los botones de abajo
	if value == true:
		for button in buttons:
			button.set_focus_mode(Control.FOCUS_NONE) #si estas en el menu inhabilita el focus en los botones
	elif value == false:
		for button in buttons:
			button.set_focus_mode(Control.FOCUS_ALL) #si sales vuelve a habilitarlo
			set_current_tab(4) #y de paso vuelve al dialogo

#agrega una opcion al panel que se le dice, fight, item o mercy
#las opciones son agregadas de izquierda a derecha

#esto agrega todas las opciones de una vez 
#primero un array con las opciones, luego con los dialogos desencadenados por la respectiva opcion en orden, y luego el panel
func add_option_page(options: Array, dialogs: Array, panel: String):
	for i in range(len(options)):
		if dialogs != null:
			add_option(options[i], panel, dialogs[i])
		else:
			add_option(options[i], panel, null)

#y esto esta mejor ahora
func add_option(option, panel, dialoge):
	match panel:
		"act": 
			panel = panels["act"]
		"fight":
			panel = panels["fight"]
		"item":
			panel = panels["item"]
		"mercy":
			panel = panels["mercy"]
		"selection":
			panel = panels["selection"]
	var first_column = panel.get_node("MarginContainer/HBoxContainer/VBoxContainer").get_children()
	var second_column = panel.get_node("MarginContainer/HBoxContainer/VBoxContainer2").get_children()
	for i in range(len(first_column)):
		if first_column[i].get_node('Label').text == '':
			first_column[i].get_node('Label').text = "* " + option
			first_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
			if dialoge != null:
				panels["act"].set_dialog(i + 1, 1, dialoge) #le dice al panel de act en donde esta el boton asignado para que se ejecute el dialogo al ser presiondo 
				panels["act"].interactions[option] = { "row": i+1, "column": 1, "dialog" : dialoge} #almacena en interactions (que es uno diccionario) la posicion, el nombre de la interaccion, y el dialogo
			break
		elif second_column[i].get_node('Label').text == '':
			second_column[i].get_node('Label').text = "* " + option
			second_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
			if dialoge != null:
				panels["act"].set_dialog(i + 1, 2, dialoge)
				panels["act"].interactions[option] = { "row": i+1, "column": 2, "dialog" : dialoge}
			break

#nueva funcion para agregar opciones en lugares especificos
func add_option_in(row: int, column: int, panel, option: String, dialog):
	match panel:
		"act":
			panel = panels["act"]
			panels["act"].interactions[option] = { "row": row, "column": column, "dialog" : dialog}
		"fight":
			panel = panels["fight"]
		"item":
			panel = panels["item"]
		"mercy":
			panel = panels["mercy"]
		"selection":
			panel = panels["selection"]
	var first_column = panel.get_node("MarginContainer/HBoxContainer/VBoxContainer").get_children()
	var second_column = panel.get_node("MarginContainer/HBoxContainer/VBoxContainer2").get_children()
	match column:
		1:
			first_column[row - 1].get_node('Label').text = "* " + option
			first_column[row - 1].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
			if dialog != null:
				panels["act"].set_dialog(row, 1, dialog)
		2:
			second_column[row - 1].get_node('Label').text = "* " + option
			second_column[row - 1].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
			if dialog != null:
				panels["act"].set_dialog(row, 2, dialog)

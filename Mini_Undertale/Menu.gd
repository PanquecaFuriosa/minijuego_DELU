extends TabContainer

#muchos nodos, si alguien sabe una mejor forma de hacer esto diganme ayuda por favor esto no es un meme

onready var fight_button = get_parent().get_parent().get_parent().get_node("Buttons/FightButton")
onready var act_button = get_parent().get_parent().get_parent().get_node("Buttons/ActButton")
onready var item_button = get_parent().get_parent().get_parent().get_node("Buttons/ItemButton")
onready var mercy_button = get_parent().get_parent().get_parent().get_node("Buttons/MercyButton")

onready var buttons = [fight_button, act_button, item_button, mercy_button]


func _ready():
	fight_button.grab_focus() 
	set_current_tab(4)
	#ejemplos de como se usa esta maravillosa funcion
	add_option("S A N S", "act")
	add_option("aduete", "act")
	add_option("mushu", "fight")
	add_option("peace was never an option", "act")
	add_option("doctor pepper", "item")
	add_option("the souls of the damned", "item")
	add_option("un peluche", "item")
	add_option("there is no mercy", "mercy")
	
	
func _process(delta):
	focus_control()
	

func focus_first_item():
	get_current_tab_control().get_node("MarginContainer/HBoxContainer/VBoxContainer/Item1/mButton").grab_focus()

#Cambiar de pestaña segun el boton presionado
func _on_FightButton_pressed():
	set_current_tab(0)
	focus_first_item()
	in_menu_mode(true)

func _on_ActButton_pressed():
	set_current_tab(1)
	focus_first_item()
	in_menu_mode(true)

func _on_ItemButton_pressed():
	set_current_tab(2)
	focus_first_item()
	in_menu_mode(true)

func _on_MercyButton_pressed():
	set_current_tab(3)
	focus_first_item()
	in_menu_mode(true)
	
#control de focus
#estando en modo menu, revisa si se presiono escape y regresa el focus al boton que se presiono antes
func focus_control():
	
	if Input.is_action_just_pressed("ui_cancel") and fight_button.is_pressed():
		in_menu_mode(false)
		fight_button.pressed = false
		fight_button.grab_focus()

	if Input.is_action_just_pressed("ui_cancel") and act_button.is_pressed():
		in_menu_mode(false)
		act_button.pressed = false
		act_button.grab_focus()
		
	if Input.is_action_just_pressed("ui_cancel") and item_button.is_pressed():
		in_menu_mode(false)
		item_button.pressed = false
		item_button.grab_focus()

	if Input.is_action_just_pressed("ui_cancel") and mercy_button.is_pressed():
		in_menu_mode(false)
		mercy_button.set_pressed(false)
		mercy_button.grab_focus()


func in_menu_mode(value: bool):
	#esto quita la posibilidad de que estando en algun panel el focus se vaya a los botones de abajo
	if value == true:
		for button in buttons:
			button.set_focus_mode(Control.FOCUS_NONE) #si estas en el menu inhabilita el focus en los botones
	elif value == false:
		for button in buttons:
			button.set_focus_mode(Control.FOCUS_ALL) #si sales vuelve a habilitarlo
			set_current_tab(4) #y de paso vuelve al dialogo

#agrega una opcion al panel que se le dice, act, fight, item o mercy
#las opciones son agregadas de izquierda a derecha
func add_option(option: String, panel: String):
	match panel:
		"act":
			var first_column = get_node("ActPanel/MarginContainer/HBoxContainer/VBoxContainer").get_children()
			var second_column = get_node("ActPanel/MarginContainer/HBoxContainer/VBoxContainer2").get_children()
			for i in  range(2):
				if first_column[i].get_node('Label').text == '':
					first_column[i].get_node('Label').text = "* " + option
					first_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
				elif second_column[i].get_node('Label').text == '':
					second_column[i].get_node('Label').text = "* " + option
					second_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
		"fight":
			var first_column = get_node("FightPanel/MarginContainer/HBoxContainer/VBoxContainer").get_children()
			var second_column = get_node("FightPanel/MarginContainer/HBoxContainer/VBoxContainer2").get_children()
			for i in  range(2):
				if first_column[i].get_node('Label').text == '':
					first_column[i].get_node('Label').text = "* " + option
					first_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
				elif second_column[i].get_node('Label').text == '':
					second_column[i].get_node('Label').text = "* " + option
					second_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
		"item":
			var first_column = get_node("ItemPanel/MarginContainer/HBoxContainer/VBoxContainer").get_children()
			var second_column = get_node("ItemPanel/MarginContainer/HBoxContainer/VBoxContainer2").get_children()
			for i in  range(2):
				if first_column[i].get_node('Label').text == '':
					first_column[i].get_node('Label').text = "* " + option
					first_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
				elif second_column[i].get_node('Label').text == '':
					second_column[i].get_node('Label').text = "* " + option
					second_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
		"mercy":
			var first_column = get_node("MercyPanel/MarginContainer/HBoxContainer/VBoxContainer").get_children()
			var second_column = get_node("MercyPanel/MarginContainer/HBoxContainer/VBoxContainer2").get_children()
			for i in  range(2):
				if first_column[i].get_node('Label').text == '':
					first_column[i].get_node('Label').text = "* " + option
					first_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
				elif second_column[i].get_node('Label').text == '':
					second_column[i].get_node('Label').text = "* " + option
					second_column[i].get_node('mButton').set_focus_mode(Control.FOCUS_ALL)
					break
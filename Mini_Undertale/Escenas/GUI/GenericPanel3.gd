extends Tabs

signal menu_button_pressed
#señal emitida por todos los botones de todas los paneles para 
#indicar el final del turno del jugador

onready var button1 =  get_node("MarginContainer/HBoxContainer/VBoxContainer/Item1")
onready var button2 =  get_node("MarginContainer/HBoxContainer/VBoxContainer/Item2")
onready var button3 =  get_node("MarginContainer/HBoxContainer/VBoxContainer/Item3")
onready var button4 =  get_node("MarginContainer/HBoxContainer/VBoxContainer2/Item4")
onready var button5 =  get_node("MarginContainer/HBoxContainer/VBoxContainer2/Item5")
onready var button6 =  get_node("MarginContainer/HBoxContainer/VBoxContainer2/Item6")

func any_button_pressed(): #funcion para ejecutarla al presionar cualquiera
	emit_signal("menu_button_pressed") #de los botones de los paneles, si se extiende en otro panel
									   #se puede personalizar como en SelectEnemy
	
func button1_pressed():
	any_button_pressed()

func button2_pressed():
	any_button_pressed()

func button3_pressed():
	any_button_pressed()

func button4_pressed():
	any_button_pressed()

func button5_pressed():
	any_button_pressed()

func button6_pressed():
	any_button_pressed()
	
	#Para que la caja tenga la apariencia que debe tener
func change_tab_style(cajita: StyleBoxFlat):
	set('custom_styles/panel',cajita)
	$Panel.set('custom_styles/panel',cajita)

extends "res://Escenas/GUI/GenericPanel3.gd"

onready var dialog_panel = get_parent().get_node("Dialogo")

#aqui se almacenan los dialogos para cada boton en el panel de act
var dialog1_c1
var dialog2_c1
var dialog3_c1
var dialog1_c2
var dialog2_c2
var dialog3_c2

onready var first_dialog = "hola soy un dialogo por defecto "
var start_dialog = "hola de nuevo"
var check_dialog


func _ready():
	get_parent().connect("player_turn_started", self, "at_turn_beginning")
	#para cambiar el dialogo al comienzo del turno

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


func at_turn_beginning():
	dialog_panel.change_dialog(start_dialog)

#esto se encarga de escuchar si el jugador presiono alguno de los botones y asi cambiar el dialogo al dialogo de dicho boton
func button1_pressed():
	.button1_pressed()
	dialog_panel.change_dialog(dialog1_c1)
	
func button2_pressed():
	.button2_pressed()
	dialog_panel.change_dialog(dialog2_c1)
	
func button3_pressed():
	.button3_pressed()
	dialog_panel.change_dialog(dialog3_c1)
	
func button4_pressed():
	.button4_pressed()
	dialog_panel.change_dialog(dialog1_c2)
	
func button5_pressed():
	.button5_pressed()
	dialog_panel.change_dialog(dialog2_c2)
	
func button6_pressed():
	.button6_pressed()
	dialog_panel.change_dialog(dialog3_c2)
	
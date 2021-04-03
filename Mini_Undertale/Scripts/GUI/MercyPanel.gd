extends "res://Escenas/GUI/GenericPanel3.gd"

signal fight_ended()

onready var act_panel = get_parent().get_node("ActPanel")
onready var dialog_panel = get_parent().get_node("Dialogo")
onready var spare_button_text = get_node("MarginContainer/HBoxContainer/VBoxContainer/Item2/Label")

var can_spare = false
var end_dialog = (
	"""* YOU WON!
	* You earned 0 XP and 12 gold."""
	)

func _ready():
	act_panel.connect("it_can_be_spared", self, "turn_color")
	yield(get_tree().create_timer(0.5), "timeout") #por alguna extraña razon, esta funcion es llamada
	get_parent().add_option("Flee", "mercy", null) #antes de que menu cargue sus nodos (aun cuando estan en onready var)
	get_parent().add_option_in(2, 1, "mercy", "Spare", null) #por eso espero 0.5 segundos para añadirlos :/
	
func turn_color():
	can_spare = true
	print("me puedes perdonar weon")
	spare_button_text.add_color_override("font_color", Color( 0, 1, 1, 1 ))
	

func button2_pressed():
	if not can_spare:
		.button2_pressed()
	if can_spare:
		dialog_panel.change_dialog(end_dialog)
		get_parent().change_tab("dialog")
		emit_signal("fight_ended")
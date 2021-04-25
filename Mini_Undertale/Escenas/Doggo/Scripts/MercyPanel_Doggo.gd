extends "res://Scripts/GUI/MercyPanel.gd"

func _ready():
	act_panel.connect("it_can_be_spared", self, "turn_color")
	yield(get_tree().create_timer(0.5), "timeout") #por alguna extraña razon, esta funcion es llamada
	get_parent().add_option_in(2, 1, "mercy", "Spare", null) #por eso espero 0.5 segundos para añadirlos :/
	
	act_panel.connect("not_spared_anymore",self,"revert_color")
	
func revert_color():
	can_spare = false
	spare_button_text.add_color_override("font_color", Color( 1, 1, 1, 1 ))

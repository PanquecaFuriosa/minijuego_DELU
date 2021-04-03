extends Tabs

onready var act_panel = get_parent().get_node("ActPanel")
onready var dialog_box = get_node('MarginContainer/GridContainer4/Label')


func _ready():
	change_dialog(act_panel.encounter_dialog) #por alguna razon, no puedo poner esto en el menu
	pass

func change_dialog(new_dialog): #basicamente todo lo relacionado con cuando se ponen
	if new_dialog != null:      #los dialgos lo hace el act panel, esto solo los muestra
		dialog_box.text = new_dialog

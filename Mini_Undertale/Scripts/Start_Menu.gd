extends Node2D

onready var world_button = $"VBoxContainer/HBoxContainer/VBoxContainer/Go to World/mButton"
onready var battle_button = $"VBoxContainer/HBoxContainer/VBoxContainer/Start Battle/mButton"

export(PackedScene) var mundo
export(PackedScene) var batalla

func _ready():
	
	#Conecta las señales al prersionar los botones para hacer el cambio de escena adecuado
	
	world_button.connect("pressed",self, "_On_Button_Press",["world"])
	battle_button.connect("pressed",self, "_On_Button_Press",["battle"])
	
	#Activa el focus en cada boton y enfoca en el primero (ir al mundo)
	world_button.set_focus_mode(Control.FOCUS_ALL)
	battle_button.set_focus_mode(Control.FOCUS_ALL)
	world_button.grab_focus()

func _On_Button_Press(value: String):
	
	match value:
		"world":
			get_tree().change_scene_to(mundo)
		"battle":
			get_tree().change_scene_to(batalla)
		#Por si acaso
		_:
			print('Escribiste mal el nombre XD')
			


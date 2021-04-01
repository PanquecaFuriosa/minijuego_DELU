extends Node2D

onready var world_button = $"VBoxContainer/HBoxContainer/VBoxContainer/Go to World/mButton"
onready var battle_button = $"VBoxContainer/HBoxContainer/VBoxContainer/Start Battle/mButton"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Activa el focus en cada boton y enfoca en el primero (ir al mundo)
	world_button.set_focus_mode(Control.FOCUS_ALL)
	battle_button.set_focus_mode(Control.FOCUS_ALL)
	world_button.grab_focus()
	print(world_button.has_focus())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

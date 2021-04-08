extends Node2D

onready var world_button = $"VBoxContainer/HBoxContainer/VBoxContainer/Go to World/mButton"
onready var battle_button = $"VBoxContainer/HBoxContainer/VBoxContainer/Start Battle/mButton"
onready var heart_move = $HeartMove

var corazonp = preload("res://Escenas/Corazon.tscn")
var corazon :Node2D

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
	
	#Musica :D
	$Menu_music.play()

func _On_Button_Press(value: String):
	
	Scene_Transition()
	
	match value:
		"world":
			get_tree().change_scene_to(mundo)
		"battle":
			#Esta funcion iniciara una animacion para mover al corazon
			Scene_Transition()
			#Espera que el corazon termine de moverse
			yield(heart_move,"tween_completed")
			get_tree().change_scene_to(batalla)
		#Por si acaso
		_:
			print('Escribiste mal el nombre XD')
	

func Scene_Transition():
	# Lo que se tiene que mover el corazon para quedar en el punto exacto 51,22
	var traslation :Vector2 = Vector2(51,22)
	#Crear nuevo corazon, ajustar su tamaño y posicion
	corazon = corazonp.instance()
	add_child(corazon)
	corazon.set_scale(Vector2(0.5,0.5))
	corazon.position = battle_button.get_parent().get_global_position() + traslation
	
	battle_button.release_focus()
	
	#Animacion del corazon moviendose
	heart_move.interpolate_property(corazon,"position",corazon.position,Vector2(25,560),0.5,Tween.TRANS_LINEAR,Tween.EASE_IN)
	heart_move.start()
	
	

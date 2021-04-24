extends Node2D
export (PackedScene) var game_over
export (PackedScene) var credits

onready var GUI_Box = $'GUI/VBoxContainer/MarginContainer2'
onready var GUI_Menu = GUI_Box.get_node('Menu')
onready var GUI
onready var Box = $'TheBox'
export (float) var box_scale :float = -352

onready var Player = $'Player'

onready var TurnTimer = $'TurnTimer'
export(float) var enemy_turn_duration :float = 5.0

onready var Commander = $'Commander'
var datos_puertas: Dictionary
var puertas_iniciales: File


func _ready():
	GUI_Menu.connect('player_turn_ended',self,"Start_Enemy_Turn")
	
	#Musica :D
	yield(get_tree().create_timer(0.5),"timeout")
	$Mixtape.play()
	
func revisa_puertas():
	puertas_iniciales = File.new()
	puertas_iniciales.open("user://Puertas habilitadas/Puertas.json", File.READ_WRITE)
	datos_puertas = JSON.parse(puertas_iniciales.get_as_text()).result

func selecciona_puerta() -> String:
	
	if typeof(datos_puertas.puerta1) == TYPE_STRING:
		return "puerta1"
	if typeof(datos_puertas.puerta2) == TYPE_STRING:
		return "puerta2"
	if typeof(datos_puertas.puerta3) == TYPE_STRING:
		return "puerta3"
	if typeof(datos_puertas.puerta4) == TYPE_STRING:
		return "puerta4"
	if typeof(datos_puertas.puerta5) == TYPE_STRING:
		return "puerta5"
	if typeof(datos_puertas.puerta6) == TYPE_STRING:
		return "puerta6"
	if typeof(datos_puertas.puerta7) == TYPE_STRING:
		return "puerta7"
	if typeof(datos_puertas.puerta8) == TYPE_STRING:
		return "puerta8"
	
	return "puerta9"
	
func habilita_puerta():
	var puerta = selecciona_puerta()
	match puerta:
		"puerta1":
			datos_puertas.puerta1 = true
		"puerta2":
			datos_puertas.puerta2 = true
		"puerta3":
			datos_puertas.puerta3 = true
		"puerta4":
			datos_puertas.puerta4 = true
		"puerta5":
			datos_puertas.puerta5 = true
		"puerta6":
			datos_puertas.puerta6 = true
		"puerta7":
			datos_puertas.puerta7 = true
		"puerta8":
			datos_puertas.puerta8 = true
		"puerta9":
			datos_puertas.puerta9 = true
	puertas_iniciales.store_line(to_json(datos_puertas))
	puertas_iniciales.close()

func inhabilita_puerta():
	var puerta = selecciona_puerta()
	match puerta:
		"puerta1":
			datos_puertas.puerta1 = false
		"puerta2":
			datos_puertas.puerta2 = false
		"puerta3":
			datos_puertas.puerta3 = false
		"puerta4":
			datos_puertas.puerta4 = false
		"puerta5":
			datos_puertas.puerta5 = false
		"puerta6":
			datos_puertas.puerta6 = false
		"puerta7":
			datos_puertas.puerta7 = false
		"puerta8":
			datos_puertas.puerta8 = false
		"puerta9":
			datos_puertas.puerta9 = false
	puertas_iniciales.store_line(to_json(datos_puertas))
	puertas_iniciales.close()

func Start_Enemy_Turn():
	#Este es el caso si la batalla no terminó en el ultimo turno del jugador, en el otro caso ehperemo que los botones
	#Hagan su trabajo XD
	
	#Esconde la GUI (Pero no la info del jugador)
	GUI_Box.visible = false
	#Escala la caja al tamaño deseado
	Box.scaleWidth(box_scale)
	#Posicionar jugador
	Player.position = Box.position
	#Mover Spawners
	#Commander.Spawner1.position = Vector2(640,256)
	#() Espera a que la caja termine de escalar
	yield(Box.tweenNode,"tween_completed")
	#Iniciar turn timer
	TurnTimer.start(enemy_turn_duration)
	#Activar Spawners
	#Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner0, 1)
	#Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner1, 0.5)
	


func Start_Player_Turn():
	#Eliminar todos los proyectiles en la escena
	for element in get_children():
		if 'projectile' in element.name:
			element.call_deferred('queue_free')
	
	#Escalar caja al tamaño de la GUI
	Box.scaleWidth(-box_scale)
	yield(Box.tweenNode,"tween_completed")
	
	#Habilitar GUI y aparecerla
	GUI_Box.visible = true
	GUI_Menu.at_player_turn_start()

func game_over():
	revisa_puertas()
	habilita_puerta()
	get_tree().change_scene_to(game_over)



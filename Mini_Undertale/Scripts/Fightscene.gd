extends Node2D
export (PackedScene) var game_over

onready var GUI_Box = $'GUI/VBoxContainer/MarginContainer2'
onready var GUI_Menu = GUI_Box.get_node('Menu')
onready var GUI
onready var Box = $'TheBox'
export (float) var box_scale :float = -352

onready var Player = $'Player'

onready var TurnTimer = $'TurnTimer'
export(float) var enemy_turn_duration :float = 5.0

onready var Commander = $'Commander'



func _ready():

	GUI_Menu.connect('player_turn_ended',self,"Start_Enemy_Turn")


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
	get_tree().change_scene_to(game_over)



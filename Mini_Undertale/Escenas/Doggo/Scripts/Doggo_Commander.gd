extends "res://Commander.gd"

onready var Spawner2 :Position2D = $'Spawner2'
onready var Spawner3 :Position2D = $'Spawner3'
onready var Spawner4 :Position2D = $'Spawner4'

var rng = RandomNumberGenerator.new()

var PET :bool = true
export (PackedScene) var Dialogs :PackedScene

func _ready():
	rng.randomize()

func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0):
	where.Fire(what, direction)
	
func Rect_Shoot_Pattern(what :PackedScene, where: Position2D, flip: bool = false):
	where.Rect_Fire(what, flip)

#Usado para los dialogos al entrar en estado PET 
func Dialog_Pattern(reload_time :float = 0.5):
	#Where: un spawner random del 1 al 4
	#What: un cuadro de dialogo random entre PET, PAT, POT (tres en uno :o)
	#Se crea sin velocidad, queda testear el reload time (y que al cumplirse el reload time se vuelva a decidir what y where.
	
	#Decide cual spawner y luego crealo (espero)
	var location = rng.randi_range(1,4)
	while PET: #El valor de esto es cambiado en Fightscene al recibir una señal de ActPanel
		#y cuando la batalla termina
		match location:
			1:
				Rect_Shoot_Pattern(Dialogs, Spawner1,true)

			2:
				Rect_Shoot_Pattern(Dialogs, Spawner2)

			3:
				Rect_Shoot_Pattern(Dialogs, Spawner3)

			4:
				Rect_Shoot_Pattern(Dialogs, Spawner4)


		location = rng.randi_range(1,4)
		
		yield(get_tree().create_timer(reload_time),"timeout")

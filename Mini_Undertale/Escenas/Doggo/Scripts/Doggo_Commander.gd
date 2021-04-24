extends "res://Commander.gd"

onready var Spawner2 :Position2D = $'Spawner2'
onready var Spawner3 :Position2D = $'Spawner3'
onready var Spawner4 :Position2D = $'Spawner4'

func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0):
	where.Fire(what, direction)
	what.connect('tween_completed',get_parent(),"Start_Enemy_Turn")

#Usado para los dialogos al entrar en estado PET 
func Dialog_Pattern(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0):
	pass
	#Where: un spawner random del 1 al 4
	#What: un cuadro de dialogo random entre PET, PAT, POT
	
	#Se crea sin velocidad, queda testear el reload time (y que al cumplirse el reload time se vuelva a decidir what y where.
	

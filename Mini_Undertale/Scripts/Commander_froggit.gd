extends "res://Commander.gd"
onready var Spawner2 :Position2D = $'Spawner2'
onready var Spawner3 :Position2D = $'Spawner3'
onready var Spawner4 :Position2D = $'Spawner4'


func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0): 
	where.Fire(what,direction)

extends "res://Commander.gd"

export (PackedScene) var Projectile2 :PackedScene

onready var Spawner2 :Position2D = $'Spawner2'
onready var Spawner3 :Position2D = $'Spawner3'
onready var Spawner4 :Position2D = $'Spawner4'

var rng = RandomNumberGenerator.new()
var is_my_turn = false

func _ready():
	._ready()
	rng.randomize()

func get_spawner(number):
	match number:
		0:
			return Spawner0
		1:
			return Spawner1
		2:
			return Spawner2
		3:
			return Spawner3
		4:
			return Spawner4

func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0): 
	while Turntimer.time_left > 0:
		rng.randomize()
		where = get_spawner(rng.randi_range(0,4))
		where.Fire(what,direction)
		yield(get_tree().create_timer(rng.randf_range(1.0,2.0)), "timeout")

func Shoot_Pattern2(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0): 
	while Turntimer.time_left > 0:
		rng.randomize()
		where = get_spawner(rng.randi_range(0,4))
		where.Fire(what,direction)
		yield(get_tree().create_timer(0.5), "timeout")


func _on_TurnTimer_timeout():
	is_my_turn = false

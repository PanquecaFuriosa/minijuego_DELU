extends Node2D


export (PackedScene) var Projectile1 :PackedScene


#Testing
var positions = [Vector2(640,256),Vector2(384,256)]
var i = 0

onready var Spawner0 = $'Spawner0'
onready var Spawner1 = $'Spawner1'


func _physics_process(delta):
	
	#Testing, The spawners should only change their position between turns, for this stuff it would be better to 
	#create timers in the scene since yields are inconsistent...
	yield(get_tree().create_timer(0.2),"timeout")
	Spawner0.position = positions[i%2]
	i += 1


func _ready():
	#Player's turn
	
	#This should run when a signal is received (the signal from the player ending his turn)
	#Start a timer for the duration of the enemies' turn (when turns are implemented)
	
	#.. And start firing (you can edit and create shoot patterns here btw)
	
	Shoot_Pattern1(Projectile1,Spawner0, 1)
	Shoot_Pattern1(Projectile1,Spawner1, 0.5)

#Just shoot them projectiles downwards
func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float, direction: float = PI/2):
	
		
	#Keep the loop as long as the turn timer isn't stopped (when turns are implemented)
	#But for now there's no stopping it B) 
	
	while true:
		where.Fire(what,direction)
		yield(get_tree().create_timer(reload_time),"timeout")


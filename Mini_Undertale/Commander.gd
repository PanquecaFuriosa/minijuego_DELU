extends Node2D


#Declarar proyectiles para colocarlos desde la escena
export (PackedScene) var Projectile1 :PackedScene



#Ten a todos los spawners que vayas a usar puestos en la escena desde el principio.
#No hay que usarlos todos al mismo tiempo.
onready var Spawner0 :Position2D = $'Spawner0'
onready var Spawner1 :Position2D = $'Spawner1'
onready var Turntimer :Timer = $"../TurnTimer"

func _ready():
	
	#This should run when a signal is received (the signal from the player ending its turn)
	
	
	#Move spawners if necessary.
	Spawner1.position = Vector2(640,256)
	#Start a timer for the duration of the enemies' turn (when turns are implemented)
	#.. And start firing (you can edit and create shoot patterns btw)
	
	Shoot_Pattern1(Projectile1,Spawner0, 1)
	Shoot_Pattern1(Projectile1,Spawner1, 0.5)

#Just shoot them projectiles downwards
func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float, direction: float = 180):
	
	#Keep the loop as long as the turn timer isn't stopped 
	
	while Turntimer.time_left > 0:
		where.Fire(what,direction)
		yield(get_tree().create_timer(reload_time),"timeout")
		

extends Node2D

onready var scene = get_node('/root/Fightscene')

func Fire(projectile, direction = -90):
	#Instancing the projectile
	var proj = projectile.instance()
	scene.add_child(proj)
	
	#Setting position
	proj.position = get_global_position()
	
	#Setting initial speed
	#proj.trayecto = Vector2(proj.velocidad,0)
	#proj.trayecto = proj.trayecto.rotated(direction)
	proj.set_rotation_degrees(direction)
	proj.elegir_trayectoria()

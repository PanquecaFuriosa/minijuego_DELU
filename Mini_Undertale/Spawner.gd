extends Node2D

onready var scene = get_node('/root/Fightscene')

func Fire(projectile, direction = PI/2):
	#Instancing the projectile
	var proj = projectile.instance()
	scene.add_child(proj)
	
	#Setting position
	
	proj.position = get_global_position()
	
	#Setting initial speed
	proj.linear_velocity = Vector2(proj.speed,0)
	proj.linear_velocity = proj.linear_velocity.rotated(direction)

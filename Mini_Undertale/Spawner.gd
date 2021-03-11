extends Node2D

func Fire(projectile, direction = PI/2):
	#Instancing the projectile
	var proj = projectile.instance()
	add_child(proj)
	
	#Setting position
	
	proj.position = position
	
	#Setting initial speed
	proj.linear_velocity = Vector2(proj.speed,0)
	proj.linear_velocity = proj.linear_velocity.rotated(direction)

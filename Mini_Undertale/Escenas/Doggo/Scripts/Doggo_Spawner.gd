extends "res://Spawner.gd"

func Rect_Fire(projectile, flip):
	#Instancing the projectile
	var proj = projectile.instance()
	proj.name = 'projectile'
	scene.add_child(proj)
	
	#Setting position
	proj.rect_position = get_global_position()  #Aqui esta la diferencia con el original. los TextureRect no tienen position como propiedad. En su lugar tienen rect_position.

	proj.flip_h = flip
	#Setting initial speed
	#proj.trayecto = Vector2(proj.velocidad,0)
	#proj.trayecto = proj.trayecto.rotated(direction)
	#proj.set_rotation_degrees(direction)
	#proj.elegir_trayectoria()

extends "res://Scripts/Fightscene.gd"

var corazon = preload("res://Escenas/Corazon.tscn")
var hitbox = preload("res://Escenas/GUI/heartcollisionshape.tres")
var ins_corazon: Sprite
var rng = RandomNumberGenerator.new()

func Start_Enemy_Turn():
	.Start_Enemy_Turn()
	var what_pattern = rng.randi_range(1,2)
	match what_pattern:
		1:
			yield(get_tree().create_timer(1), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner0)
			yield(get_tree().create_timer(1), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner1)
			yield(get_tree().create_timer(1), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner2)
			yield(get_tree().create_timer(1), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner3)
			yield(get_tree().create_timer(1), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner4)
			
		2:
			Commander.Shoot_Pattern1(Commander.Projectile2,Commander.Spawner5)
			
func _ready():
	$Nubes.position = $Enemy.position
	$Nubes2.position = $Enemy.position
	$Nubes3.position = $Enemy.position
	$Nubes4.position = $Enemy.position
	$Nubes5.position = $Enemy.position
	rng.randomize()
	get_child(3).get_child(1).queue_free()
	get_child(3).get_child(4).queue_free()
	get_child(3).get_child(0).set_shape(hitbox)
	ins_corazon = corazon.instance()
	get_child(3).add_child(ins_corazon)
	

func _on_GUI_back_world():
	$Vaporized.play()
	$Nubes.set_emitting(true)
	$Nubes2.set_emitting(true)
	$Nubes3.set_emitting(true)
	$Nubes4.set_emitting(true)
	$Nubes5.set_emitting(true)
	yield(get_tree().create_timer(1.71), "timeout")
	$Vaporized.stop()
	yield(get_tree().create_timer(3), "timeout")
	revisa_puertas()
	inhabilita_puerta()
	var values = datos_puertas.values()
	var seguir = false
	for value in values:
		seguir = seguir or value
	if seguir:
		get_tree().change_scene("res://main.tscn")
	else:
		get_tree().change_scene_to(credits)



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
			Commander.Shoot_Pattern1(Commander.Projectile1, Commander.get_spawner(rng.randi_range(0,4)))
			yield(get_tree().create_timer(0.5), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
			yield(get_tree().create_timer(0.5), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
			yield(get_tree().create_timer(0.5), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
			yield(get_tree().create_timer(0.5), "timeout")
			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
		2:
			for i in range(2):
				Commander.Shoot_Pattern1(Commander.Projectile2, Commander.get_spawner(rng.randi_range(0,4)))
				yield(get_tree().create_timer(0.5), "timeout")
				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))
				yield(get_tree().create_timer(0.5), "timeout")
				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))
				yield(get_tree().create_timer(0.5), "timeout")
				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))
				yield(get_tree().create_timer(0.5), "timeout")
				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))

func _ready():
	rng.randomize()
	get_child(3).get_child(1).queue_free()
	get_child(3).get_child(4).queue_free()
	get_child(3).get_child(0).set_shape(hitbox)
	ins_corazon = corazon.instance()
	get_child(3).add_child(ins_corazon)
	


func _on_GUI_back_world():
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://main.tscn")

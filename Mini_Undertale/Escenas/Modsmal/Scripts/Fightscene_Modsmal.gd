extends "res://Scripts/Fightscene.gd"


var corazon = preload("res://Escenas/Corazon.tscn")
var hitbox = preload("res://Escenas/GUI/heartcollisionshape.tres")
var ins_corazon: Sprite
var rng = RandomNumberGenerator.new()



func Start_Enemy_Turn():
	GUI_Box.visible = false
	Box.scaleWidth(box_scale)
	Player.position = Box.position
	yield(Box.tweenNode,"tween_completed")
	TurnTimer.start(enemy_turn_duration)
	
	Commander.is_my_turn = true
	var what_pattern = rng.randi_range(1,2)
	match what_pattern:
		1:
			Commander.Shoot_Pattern1(Commander.Projectile1, Commander.get_spawner(rng.randi_range(0,4)))
#			Commander.Shoot_Pattern1(Commander.Projectile1, Commander.get_spawner(rng.randi_range(0,4)))
#			yield(get_tree().create_timer(rng.randf_range(1,2)), "timeout")
#			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
#			yield(get_tree().create_timer(rng.randf_range(1,2)), "timeout")
#			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
#			yield(get_tree().create_timer(rng.randf_range(1,2)), "timeout")
#			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
#			yield(get_tree().create_timer(rng.randf_range(1,2)), "timeout")
#			Commander.Shoot_Pattern1(Commander.Projectile1,Commander.get_spawner(rng.randi_range(0,4)))
		2:
			Commander.Shoot_Pattern2(Commander.Projectile2, Commander.get_spawner(rng.randi_range(0,4)))
#			for i in range(3):
#				Commander.Shoot_Pattern1(Commander.Projectile2, Commander.get_spawner(rng.randi_range(0,4)))
#				yield(get_tree().create_timer(0.5), "timeout")
#				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))
#				yield(get_tree().create_timer(0.5), "timeout")
#				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))
#				yield(get_tree().create_timer(0.5), "timeout")
#				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))
#				yield(get_tree().create_timer(0.5), "timeout")
#				Commander.Shoot_Pattern1(Commander.Projectile2,Commander.get_spawner(rng.randi_range(0,4)))

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

extends "res://Scripts/Fightscene.gd"

var corazon = preload("res://Escenas/Corazon.tscn")
var ins_corazon: Sprite

func Start_Enemy_Turn():
	.Start_Enemy_Turn()
	Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner0)
	yield(get_tree().create_timer(1), "timeout")
	Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner1)
	yield(get_tree().create_timer(1), "timeout")
	Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner2)
	yield(get_tree().create_timer(1), "timeout")
	Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner3)
	yield(get_tree().create_timer(1), "timeout")
	Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner4)

func _ready():
	get_child(3).get_child(1).queue_free()
	get_child(3).get_child(4).queue_free()
	ins_corazon = corazon.instance()
	get_child(3).add_child(ins_corazon)
	


func _on_GUI_back_world():
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://main.tscn")

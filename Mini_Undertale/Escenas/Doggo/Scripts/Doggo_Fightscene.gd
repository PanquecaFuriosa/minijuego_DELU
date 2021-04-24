extends "res://Scripts/Fightscene.gd"

var corazon = preload("res://Escenas/Corazon.tscn")
var hitbox = preload("res://Escenas/GUI/heartcollisionshape.tres")
var ins_corazon: Sprite

onready var GUI_ActPanel = GUI_Menu.get_node("ActPanel")

func Start_Enemy_Turn():
	
	.Start_Enemy_Turn()
	yield(Box.tweenNode,"tween_completed")
	Commander.Shoot_Pattern1(Commander.Projectile1,Commander.Spawner0, 1)
	

#Por que raios esto no funciona si lo pongo en el script Base :D?
func _ready():
	get_child(3).get_child(1).queue_free()
	get_child(3).get_child(4).queue_free()
	get_child(3).get_child(0).set_shape(hitbox)
	ins_corazon = corazon.instance()
	get_child(3).add_child(ins_corazon)
	


func _on_GUI_back_world():
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://main.tscn")


func Proj_movement_detected(detected :bool):
	GUI_ActPanel.player_moved = detected


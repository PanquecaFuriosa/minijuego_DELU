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
	
	#setear las posiciones de las particulas
	$Nubes.position = $Enemy.position
	$Nubes2.position = $Enemy.position
	$Nubes3.position = $Enemy.position
	$Nubes4.position = $Enemy.position
	$Nubes5.position = $Enemy.position
	
	#setear la cantidad (Doggo es mas grande asi que debe tener más)
	$Nubes.set_amount(12)
	$Nubes2.set_amount(12)
	$Nubes3.set_amount(12)
	$Nubes4.set_amount(12)
	$Nubes5.set_amount(12)
	
	#setear el radio para que se expanda más
	$Nubes.set_emission_sphere_radius(90)
	$Nubes2.set_emission_sphere_radius(90)
	$Nubes3.set_emission_sphere_radius(90)
	$Nubes4.set_emission_sphere_radius(90)
	$Nubes5.set_emission_sphere_radius(90)
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


func Proj_movement_detected(detected :bool):
	GUI_ActPanel.player_moved = detected


#PET? PAT? POT?
func _on_ActPanel_it_can_be_spared():
	Commander.PET = true
	Commander.Dialog_Pattern(0.6)

# :c
func _on_ActPanel_not_spared_anymore():
	Commander.PET = false

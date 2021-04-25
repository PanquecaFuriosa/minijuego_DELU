extends Node2D
var sprite = preload("res://Escenas/Doggo/Scenes/Spared.tscn") 
var doggo_perdonado: TileMap
onready var Animate = $AnimationPlayer
onready var Head = $Head


func _on_ActPanel_it_can_be_spared():
	Head.position = Vector2(-2.837,-48.167)
	Animate.play("Excited")


func _on_ActPanel_not_spared_anymore():
	Head.position = Vector2(-8.167,-48.167)
	Animate.play("suspicious")

func _on_GUI_back_world():
	get_child(0).queue_free()
	get_child(1).queue_free()
	get_child(2).queue_free()
	get_child(3).queue_free()
	doggo_perdonado = sprite.instance()
	add_child(doggo_perdonado)


# Replace with function body.

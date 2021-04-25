extends KinematicBody2D
var sprite_perdonado = preload("res://Escenas/Froggit_perdonado.tscn")
var sprite: Sprite


func _on_GUI_back_world():
	get_child(0).queue_free()
	get_child(1).queue_free()
	sprite = sprite_perdonado.instance()
	add_child(sprite)
	

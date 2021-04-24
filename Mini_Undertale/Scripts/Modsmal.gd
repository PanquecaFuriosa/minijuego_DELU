extends Node2D
var sprite = preload("res://Escenas/Modsmal/Scenes/Modsmal_perdonado.tscn") 
var modsmal_perdonado: Sprite

func _on_GUI_back_world():
	get_child(0).queue_free()
	modsmal_perdonado = sprite.instance()
	add_child(modsmal_perdonado)
	
	

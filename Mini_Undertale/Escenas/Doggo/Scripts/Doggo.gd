extends Node2D
var sprite = preload("res://Escenas/Doggo/Scenes/Spared.tscn") 
var doggo_perdonado: TileMap

func _on_GUI_back_world():
	get_child(0).queue_free()
	get_child(1).queue_free()
	get_child(2).queue_free()
	get_child(3).queue_free()
	doggo_perdonado = sprite.instance()
	add_child(doggo_perdonado)

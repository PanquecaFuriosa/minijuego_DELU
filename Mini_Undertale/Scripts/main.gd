extends Node2D
export (PackedScene) var escena

func _on_Puertas_cambia_scena(valor):
	get_tree().change_scene_to(escena)

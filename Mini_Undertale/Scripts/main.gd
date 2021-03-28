extends Node2D
export (PackedScene) var batalla
export (PackedScene) var game_over

#Cambio de escena a la de batalla
func _on_Puertas_cambia_scena(valor):
	get_tree().change_scene_to(batalla)

#Cambia a la pantalla de game over
func _on_Player_game_over():
	get_tree().change_scene_to(game_over)

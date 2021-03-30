extends Node2D
export (PackedScene) var batalla
var fondo_negro = preload("res://Escenas/Fondo.tscn")
var corazonp = preload("res://Escenas/Corazon.tscn")
var corazon: Node2D
var fondo: Node2D
var mueve_corazon = false
var velocidad_corazon: Vector2
var rapidez_corazon = 600

#Cambio de escena a la de batalla
func _on_Puertas_cambia_scena(valor):
	fondo = fondo_negro.instance()
	corazon = corazonp.instance()
	add_child(fondo)
	add_child(corazon)
	corazon.position = get_child(0).position
	get_child(0).queue_free()
	mueve_corazon = true
	
	
func _process(delta):
	if mueve_corazon and not(corazon.position.y > 555 and corazon.position.y < 565 and corazon.position.x < 29 and corazon.position.x > 21):
		velocidad_corazon = Vector2(26, 560) - get_child(3).position
		velocidad_corazon = velocidad_corazon.normalized()
		get_child(3).translate(velocidad_corazon * delta * rapidez_corazon)
	elif mueve_corazon and corazon.position.y > 555 and corazon.position.y < 565 and corazon.position.x < 29 and corazon.position.x > 21:
		get_tree().change_scene_to(batalla)

extends Node2D
export (PackedScene) var batalla
var fondo_negro = preload("res://Escenas/Fondo.tscn")
var corazonp = preload("res://Escenas/Corazon.tscn")
var playerhitbox = preload("res://Sprites/Recursos/playercollisionshape.tres")
var corazon: Node2D
var fondo: Node2D
var mueve_corazon = false
var velocidad_corazon: Vector2
export var rapidez_corazon = 1500

func _ready():
	
	get_node("Player/CollisionShape2D").set_shape(playerhitbox)
	#Musica :D 
	yield(get_tree().create_timer(0.5),'timeout')
	$Ambient_music.play()

#Cambio de escena a la de batalla
func _on_Puertas_cambia_scena(valor):
	fondo = fondo_negro.instance()
	corazon = corazonp.instance()
	add_child(fondo)
	add_child(corazon)
	$BattleFall.play()
	corazon.position = get_child(0).position
	get_child(0).queue_free()
	mueve_corazon = true
	
	
func _process(delta):
	#Este es el movimiento del corazon en la transicion a la batalla
	if mueve_corazon and not(corazon.position.y > 550 and corazon.position.y < 570 and corazon.position.x < 34 and corazon.position.x > 16):
		velocidad_corazon = Vector2(30, 560) - get_child(5).position
		velocidad_corazon = velocidad_corazon.normalized()

		get_child(5).translate(velocidad_corazon * delta * rapidez_corazon)
	elif mueve_corazon and corazon.position.y > 550 and corazon.position.y < 570 and corazon.position.x < 34 and corazon.position.x > 16:
		get_tree().change_scene_to(batalla)
		

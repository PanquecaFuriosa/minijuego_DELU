extends Node2D
var fondo_negro = preload("res://Escenas/Fondo.tscn")
var corazonp = preload("res://Escenas/Corazon.tscn")
var playerhitbox = preload("res://Sprites/Recursos/playercollisionshape.tres")
var corazon: Node2D
var batalla: PackedScene
var fondo: Node2D
var mueve_corazon = false
var velocidad_corazon: Vector2
export var rapidez_corazon = 1300
var datos_puertas: Dictionary

func revisa_puertas():
	var puertas_iniciales = File.new()
	puertas_iniciales.open("user://Puertas habilitadas/Puertas.json", File.READ)
	datos_puertas = JSON.parse(puertas_iniciales.get_as_text()).result
	puertas_iniciales.close()

func inhabilita_puertas():
	if not(datos_puertas.puerta1):
		$Puertas.get_node("Puerta 1/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta2):
		$Puertas.get_node("Puerta 2/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta3):
		$Puertas.get_node("Puerta 3/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta4):
		$Puertas.get_node("Puerta 4/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta5):
		$Puertas.get_node("Puerta 5/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta6):
		$Puertas.get_node("Puerta 6/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta7):
		$Puertas.get_node("Puerta 7/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta8):
		$Puertas.get_node("Puerta 8/CollisionShape2D").queue_free()
	if not(datos_puertas.puerta9):
		$Puertas.get_node("Puerta 9/CollisionShape2D").queue_free()

	
func _ready():
	print("hola")
	revisa_puertas()
	inhabilita_puertas()
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
	match valor:
		1:
			batalla =  preload("res://Escenas/Froggit_batalla.tscn")
		2:
			batalla =  preload("res://Escenas/Modsmal/Scenes/Fightscene_Modsmal.tscn")
		3:
			batalla =  preload("res://Escenas/Froggit_batalla.tscn")
	yield(get_tree().create_timer(0.32),'timeout')
	$BattleFall.stop()
	
func _process(delta):
	#Este es el movimiento del corazon en la transicion a la batalla
	if mueve_corazon and not(corazon.position.y > 545 and corazon.position.y < 575 and corazon.position.x < 39 and corazon.position.x > 11):
		velocidad_corazon = Vector2(30, 560) - get_child(5).position
		velocidad_corazon = velocidad_corazon.normalized()

		get_child(5).translate(velocidad_corazon * delta * rapidez_corazon)
	elif mueve_corazon and corazon.position.y > 540 and corazon.position.y < 575 and corazon.position.x < 39 and corazon.position.x > 11:
		get_tree().change_scene_to(batalla)



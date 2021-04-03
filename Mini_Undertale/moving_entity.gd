extends KinematicBody2D

onready var Hitbox = $'CollisionShape2D'

onready var Movement = $'Movement'
export(float) var speed :float = 50 

func _ready():
	Movement.speed =speed

func _on_Health_die():
	get_parent().game_over()

func _process(delta):
	if Input.is_action_pressed("move_left"):
		get_child(4).play("izquierda")
	elif Input.is_action_pressed("move_right"):
		get_child(4).play("derecha")
	elif Input.is_action_pressed("move_up"):
		get_child(4).play("arriba")
	elif Input.is_action_pressed("move_down"):
		get_child(4).play("abajo")
	else:
		get_child(4).stop()

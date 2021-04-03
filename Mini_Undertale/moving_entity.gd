extends KinematicBody2D

onready var Hitbox = $'CollisionShape2D'

onready var Movement = $'Movement'
export(float) var speed :float = 50 

func _ready():
	Movement.speed =speed

func _on_Health_die():
	get_parent().game_over()

func _process(delta):
	if Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up"):
		get_child(4).play("arriba")
	else:
		get_child(4).stop()

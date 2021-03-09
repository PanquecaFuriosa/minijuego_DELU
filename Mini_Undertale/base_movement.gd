extends Node2D

class_name base_movement
# Declare member variables here.

var entity: KinematicBody2D

var speed :float
var direction :Vector2 = Vector2.ZERO

func _ready():
	entity = get_parent()

func _physics_process(delta: float) -> void:
	
	if Get_input() != null:
		direction = Get_input()
		

	entity.move_and_slide(direction*speed)

		
	#Decide como se va a mover la entidad, depende (por ejemplo el movimiento del jugador es diferente a todos los demas)
func Get_input():
	pass
	

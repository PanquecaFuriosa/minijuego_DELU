extends Node2D


# Declare member variables here.

var entity: KinematicBody2D

export(float) var speed :float = 50 
var direction :Vector2 = Vector2.ZERO

func _ready():
	entity = get_parent()

func _physics_process(delta: float) -> void:
	
	if Get_input() != null:
		direction = Get_input()
		
	entity.move_and_slide(direction*speed)
		
		
func Get_input() -> Vector2:
	#Cuando se tiene que mover esta wea
	var axis: Vector2 = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis.normalized()
	

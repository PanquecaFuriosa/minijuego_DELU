extends KinematicBody2D

onready var Hitbox = $'CollisionShape2D'

onready var Movement = $'Movement'
export(float) var speed :float = 50 

func _ready():
	Movement.speed =speed

func _on_Health_die():
	get_parent().game_over()

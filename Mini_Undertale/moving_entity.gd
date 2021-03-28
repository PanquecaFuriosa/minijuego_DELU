extends KinematicBody2D
signal game_over()

onready var Hitbox = $'CollisionShape2D'

onready var Movement = $'Movement'
export(float) var speed :float = 50 

func _ready():
	Movement.speed =speed

func _on_Health_die():
	emit_signal("game_over")

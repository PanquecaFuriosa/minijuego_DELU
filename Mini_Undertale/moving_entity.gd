extends KinematicBody2D



onready var Movement = $'Movement'
export(float) var speed :float = 50 

func _ready():
	get_node("CollisionShape2D").set_deferred('disabled',true)
	Movement.speed =speed

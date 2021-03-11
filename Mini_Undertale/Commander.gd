extends Node2D


export (PackedScene) var Projectile1 :PackedScene

onready var Spawner0 = $'Spawner0'

func _physics_process(delta):
	
	if Input.is_action_just_pressed("fire"):
		Spawner0.Fire(Projectile1)

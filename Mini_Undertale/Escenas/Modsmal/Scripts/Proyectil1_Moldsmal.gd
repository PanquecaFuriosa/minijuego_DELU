extends Area2D

var projectile0 = preload("res://Escenas/Modsmal/Scenes/Projectil0_Moldsmal.tscn")

export var velocity = 60
var time_b4_explotion
onready var timer = $"Timer"
var rng = RandomNumberGenerator.new()
export(int) var damage :int = 5

func _ready():
	rng.randomize()
	timer.set_wait_time(rng.randf_range(0.2, 0.5))

func _process(delta):
	var direction  = Vector2.DOWN * velocity * delta
	position += direction
	

func _on_Timer_timeout():
	queue_free()
	var circle_projectiles = projectile0.instance()
	circle_projectiles.global_position = global_position
	get_parent().add_child(circle_projectiles)

var first_impact = true

func _on_Proyectil1_Modsmal_body_entered(body):
	if first_impact:
		first_impact = false
		pass
	else:
		if body.name == "Player":
			self.call_deferred('queue_free')
			body.get_node('Health').Health_Update(damage)
		else:
			self.call_deferred('queue_free')

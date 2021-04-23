extends Area2D
export var rapidez = 120
var trayecto :Vector2 = Vector2.ZERO
export(int) var damage :int = 5
export var tiempo = 2
export var intervalo = 0.5
export var ancho_trayecto = 200
export var alto_trayecto = 70
var x = 0
var y = 0
var mueve = false
var c = 0
var posicion_cajita = 430

func _ready():
	ancho_trayecto = clamp(ancho_trayecto, 195, 205)
	alto_trayecto = clamp(alto_trayecto, 65, 75)
	yield(get_tree().create_timer(2), "timeout")
	mueve = true
	

func _process(delta):
	if self.position.x <= posicion_cajita:
		self.queue_free()
	if c >= 1:
		return;
	if mueve:
		var pos_vieja = Vector2(x, y)
		c += intervalo*delta
		x = -(lerp(0, ancho_trayecto, c))
		y = -((-2*c + 1)*(2*c - 1) + 1) * alto_trayecto
		trayecto = Vector2(x, y) - pos_vieja
		translate(trayecto)
		

func _on_Proyectil_body_entered(body):
	self.call_deferred('queue_free')
	body.get_node('Health').Health_Update(damage)
	

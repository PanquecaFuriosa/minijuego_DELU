extends Node2D
var trozo1_pre = preload("res://Escenas/Trozo1.tscn")
var trozo2_pre = preload("res://Escenas/Trozo2.tscn")
var trozo3_pre = preload("res://Escenas/Trozo3.tscn")
var seg = 0
var invisible = true
var trozo1
var trozo2
var trozo3
var trozo4
var trozo5
var trozo6

func instanciar(trozo_a, trozo_b, trozo_c: RigidBody2D):
	"""Funcion que dados tres variables tipo rigidbody, les asigna
	un trozo de corazón ya pre cargado y se les da la posicion inicial.
	
	Argumentos:
		trozo_a: Se le asigna el primer trozo
		trozo_b: se le asigna el segundo trozo
		trozo_c: se le asigna el tercer trozo (son solo 3 esprites
		y son 6 trozos)
	Retorna:
		Nadita :v
	"""
	trozo_a = trozo1_pre.instance()
	trozo_b = trozo2_pre.instance()
	trozo_c = trozo3_pre.instance()
	add_child(trozo_a)
	add_child(trozo_b)
	add_child(trozo_c)
	trozo_a.position = Vector2(0, 65)
	trozo_b.position = Vector2(0, 65)
	trozo_c.position = Vector2(0, 65)
	
func _process(delta):
	if seg < 2:
		seg += delta
	elif invisible and seg >= 2:
		instanciar(trozo1, trozo2, trozo3)
		instanciar(trozo4, trozo5, trozo6)
		self.get_child(5).apply_impulse(Vector2(0, 650), Vector2(-60, -100))
		self.get_child(6).apply_impulse(Vector2(0, 65), Vector2(-80, -150))
		self.get_child(7).apply_impulse(Vector2(0, 65), Vector2(-120, -120))
		self.get_child(8).apply_impulse(Vector2(0, 65), Vector2(60, -120))
		self.get_child(9).apply_impulse(Vector2(0, 65), Vector2(90, -130))
		self.get_child(10).apply_impulse(Vector2(0, 65), Vector2(100, -130))
		invisible = false
	
	elif not(invisible) and seg >= 2 and seg < 10:
		seg += delta
	

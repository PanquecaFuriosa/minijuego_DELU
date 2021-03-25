extends Node2D

const MARGIN_TEMP = 10 #esto temporalmente hasta que descubra como demonios tomar el margen del margin container



onready var tweenNode = $'Tween'
onready var spriteNode =$'Sprite'
onready var gui = get_parent().get_node('GUI')
onready var player = get_parent().get_node('Player')
onready var own_space = gui.get_node('VBoxContainer/MarginContainer2')

#Ancho y alto del sprite sin escalar
onready var spriteWidth = spriteNode.texture.get_width()
onready var spriteHeight = spriteNode.texture.get_height()


#Esto toma el borde de arriba del contenedor del medidor de hp 
#y le agrega un margen 
onready var labels = gui.get_node('MarginContainer')
onready var labelsMargin = labels.rect_position.y - MARGIN_TEMP

#Esto toma la mitad del ancho del contenedor ya mencionado
onready var labelsCenter = labels.rect_size.x/2

#Escala que debe tomar la caja al inicio (mientras no cambien su tamaño en la escena)

#centra la caja y al jugador  en la posicion inicial
func centerBox():
	global_position.x = own_space.rect_size.x/2
	global_position.y = own_space.rect_position.y + own_space.rect_size.y/2
	player.global_position = global_position

func _ready():
	#posicion y escala inicial de la caja
	centerBox()
	scaleSize(432, 64)

	get_parent().get_node("GUI/VBoxContainer/MarginContainer2/Menu").connect("player_turn_ended",self,"Start_Enemy_Turn")
	
	
	

func scaleWidth(pixels):
	#escala la caja aumentandole la cantidad de pixeles 
	#a la derecha y a la izquierda a la vez
	var new_scale = (((scale.x * spriteWidth + pixels*2) * scale.x) / (scale.x * spriteWidth))
	#lo de arriba lo calcule con una regla de tres
	
	var current_y = scale.y
	tweenNode.interpolate_property(self, "scale", scale, Vector2(new_scale,current_y), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tweenNode.start()
	

func scaleHeight(pixels):
	#escala la caja aumentandole la cantidad de pixeles 
	#arriba y abajo a la vez
	var new_scale = (((scale.y * spriteHeight + pixels*2) * scale.y) / (scale.y * spriteHeight))
	
	
	var current_x = scale.x
	tweenNode.interpolate_property(
		self, "scale", scale, Vector2(current_x, new_scale), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	tweenNode.start()
	fix_height(new_scale)
	
	
	# esto es para evitar que se sobreponga en la gui de abajo, como cosa rara si funciona.
	
#Para cambiar escala en todas las direcciones, ya que las 2 anteriores pueden no funcionar si se llama una justo despues de la otra.
func scaleSize(width = 0, height = 0):
	scaleWidth(width)
	#yield(get_tree().create_timer(0.5),"timeout")
	yield(tweenNode,"tween_completed")
	scaleHeight(height)
	
	var current_x = scale.x
	var current_y = scale.y
	
	
func fix_height(new_scale):
	var h_box = position.y
	var h_rect = (new_scale * spriteHeight)/2
	var h_total_box = h_box + h_rect
	if h_total_box - labelsMargin > 0:
		tweenNode.interpolate_property(self, "position", position, Vector2(position.x, labelsMargin - ((new_scale * spriteHeight)/2)) , 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tweenNode.start()
		
func Start_Enemy_Turn():
	scaleWidth(-384)
	


extends Node2D

const MARGIN_TEMP = 10 #esto temporalmente hasta que descubra como demonios tomar el margen del margin container



onready var tweenNode = $'Tween'
onready var boxNode =$Panel
onready var gui = get_parent().get_node('GUI')
onready var player = get_parent().get_node('Player')
onready var own_space = gui.get_node('VBoxContainer/MarginContainer2')

#Ancho y alto del box sin escalar
#get_margin da la distancia entre un borde y el anchor (que en este caso esta en el centro de la caja)
#0: izquierda, 2:derecha
onready var boxWidth = boxNode.get_margin(2) - boxNode.get_margin(0)
#1: arriba, 3:abajo
onready var boxHeight = boxNode.get_margin(3) - boxNode.get_margin(1)

#Esto toma el borde de arriba del contenedor del medidor de hp 
#y le agrega un margen 
onready var labels = gui.get_node('MarginContainer')
onready var labelsMargin = labels.rect_position.y - MARGIN_TEMP

#Esto toma la mitad del ancho del contenedor ya mencionado
onready var labelsCenter = labels.rect_size.x/2

#Tiempo que tarda en escalar
export(float) var scale_time :float =1.0

#centra la caja y al jugador  en la posicion inicial
func centerBox():
	global_position.x = own_space.rect_size.x/2
	global_position.y = own_space.rect_position.y + own_space.rect_size.y/2
	player.global_position = global_position

func _ready():
	#posicion y escala inicial de la caja
	centerBox()
	scaleSize(432, 64)

func scaleWidth(pixels):
	#escala la caja aumentandole la cantidad de pixeles 
	#a la derecha y a la izquierda a la vez
	var new_scale = (((scale.x * boxWidth + pixels*2) * scale.x) / (scale.x * boxWidth))
	#lo de arriba lo calcule con una regla de tres
	
	var current_y = scale.y
	tweenNode.interpolate_property(self, "scale", scale, Vector2(new_scale,current_y), scale_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tweenNode.start()
	

func scaleHeight(pixels):
	#escala la caja aumentandole la cantidad de pixeles 
	#arriba y abajo a la vez
	var new_scale = (((scale.y * boxHeight + pixels*2) * scale.y) / (scale.y * boxHeight))
	
	
	var current_x = scale.x
	tweenNode.interpolate_property(
		self, "scale", scale, Vector2(current_x, new_scale), scale_time, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	tweenNode.start()
	fix_height(new_scale)
	
	
	# esto es para evitar que se sobreponga en la gui de abajo, como cosa rara si funciona.
	
#Para cambiar escala en todas las direcciones, ya que las 2 anteriores pueden no funcionar si se llama una justo despues de la otra.
func scaleSize(width = 0, height = 0):
	scaleWidth(width)
	yield(tweenNode,"tween_completed")
	scaleHeight(height)
	
	var current_x = scale.x
	var current_y = scale.y
	
	
func fix_height(new_scale):
	var h_box = position.y
	var h_rect = (new_scale * boxHeight)/2
	var h_total_box = h_box + h_rect
	if h_total_box - labelsMargin > 0:
		tweenNode.interpolate_property(self, "position", position, Vector2(position.x, labelsMargin - ((new_scale * boxHeight)/2)) , 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tweenNode.start()


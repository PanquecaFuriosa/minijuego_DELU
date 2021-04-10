extends Node2D

onready var GUI_Menu = get_node("/root/Fightscene/GUI/VBoxContainer/MarginContainer2/Menu")

func _ready():
	GUI_Menu.connect("player_turn_started", self, "clean_projectiles")
	var counter = 0
	var counter_in_rads = 0
	for projectiles in get_children():	
		projectiles.set_rotation_degrees(-counter) 
		projectiles.direction = projectiles.direction.rotated(-counter_in_rads)
		counter += 40
		counter_in_rads += 0.698132

func clean_projectiles():
	for child in get_children():
		child.call_deferred('queue_free')

extends Node2D

onready var GUI = $'GUI'


func _ready():
	
	GUI.get_node('VBoxContainer/MarginContainer2/Menu').connect('player_turn_ended',self,"Start_Enemy_Turn")


func Start_Enemy_Turn():
	GUI.visible = false
	


extends "res://Escenas/GUI/GenericPanel3.gd"

onready var enemy_name = get_node("MarginContainer/HBoxContainer/VBoxContainer/Item1/Label")
onready var act_panel = get_parent().get_node("ActPanel")

func _ready():
	act_panel.connect("it_can_be_spared", self, "turn_color")

func any_button_pressed():
	get_parent().change_tab("act")

func turn_color():
	enemy_name.add_color_override("font_color",Color( 0, 1, 1, 1 ))
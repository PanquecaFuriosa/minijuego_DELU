extends "res://SelectionPanel.gd"

func _ready():
	._ready()
	act_panel.connect("not_spared_anymore", self, "revert_color")

func revert_color():
	enemy_name.add_color_override("font_color",Color( 1, 1, 1, 1 ))

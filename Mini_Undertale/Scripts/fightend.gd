extends VBoxContainer
signal back_world()

func _on_Menu_fight_ended():
	emit_signal("back_world")

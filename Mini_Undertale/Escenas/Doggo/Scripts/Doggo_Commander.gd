extends "res://Commander.gd"

func Shoot_Pattern1(what :PackedScene, where: Position2D, reload_time :float = 0, direction: float = 0):
	where.Fire(what, direction)
	what.tween.connect('tween_completed',get_parent(),"Start_Enemy_Turn")

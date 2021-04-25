extends Node2D

onready var Animate = $AnimationPlayer
onready var Head = $Head


func _on_ActPanel_it_can_be_spared():
	Head.position = Vector2(-2.837,-48.167)
	Animate.play("Excited")


func _on_ActPanel_not_spared_anymore():
	Head.position = Vector2(-8.167,-48.167)
	Animate.play("suspicious")

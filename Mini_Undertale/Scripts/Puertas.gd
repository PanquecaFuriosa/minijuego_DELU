extends Node2D
signal cambia_scena(valor)

func _on_Puerta_1_body_entered(body):
	emit_signal("cambia_scena", 1)
	
func _on_Puerta_2_body_entered(body):
	emit_signal("cambia_scena", 2)

func _on_Puerta_3_body_entered(body):
	emit_signal("cambia_scena", 3)

func _on_Puerta_4_body_entered(body):
	emit_signal("cambia_scena", 1)

func _on_Puerta_5_body_entered(body):
	emit_signal("cambia_scena", 2)

func _on_Puerta_6_body_entered(body):
	emit_signal("cambia_scena", 3)

func _on_Puerta_7_body_entered(body):
	emit_signal("cambia_scena", 1)

func _on_Puerta_8_body_entered(body):
	emit_signal("cambia_scena", 2)

func _on_Puerta_9_body_entered(body):
	emit_signal("cambia_scena", 3)
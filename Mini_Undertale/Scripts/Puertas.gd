extends Node2D
signal cambia_scena(valor)
var datos: String
var datos_a_guardar: Dictionary
var puertas: File

func abrir_json_puertas():
	puertas = File.new()
	puertas.open("user://Puertas habilitadas/Puertas.json", File.READ_WRITE)
	datos = puertas.get_as_text()
	datos_a_guardar = JSON.parse(datos).result
	
func _on_Puerta_1_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta1 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 1)
	
func _on_Puerta_2_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta2 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 2)
	
func _on_Puerta_3_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta3 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 3)

func _on_Puerta_4_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta4 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 1)

func _on_Puerta_5_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta5 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 2)

func _on_Puerta_6_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta6 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 3)

func _on_Puerta_7_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta7 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 1)

func _on_Puerta_8_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta8 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 2)

func _on_Puerta_9_body_entered(body):
	abrir_json_puertas()
	datos_a_guardar.puerta9 = "None"
	puertas.store_line(to_json(datos_a_guardar))
	puertas.close()
	emit_signal("cambia_scena", 3)


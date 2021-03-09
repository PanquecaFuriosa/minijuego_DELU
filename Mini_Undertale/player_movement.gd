extends base_movement


func Get_input() -> Vector2:
	#determina direccion del movimiento basado en las teclas presionadas
	var axis: Vector2 = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis.normalized()

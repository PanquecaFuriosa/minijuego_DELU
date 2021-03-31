extends Tabs

signal menu_button_pressed
#señal emitida por todos los botones de todas los paneles para 
#indicar el final del turno del jugador

func any_button_pressed(): #funcion para ejecutarla al presionar cualquiera
	emit_signal("menu_button_pressed") #de los botones de los paneles, si se extiende en otro panel
	                                   #se puede personalizar como en SelectEnemy
	

func button1_pressed():
	print("aduete")
	any_button_pressed()

func button2_pressed():
	print("aduete") # Replace with function body.
	any_button_pressed()

func button3_pressed():
	print("aduete") # Replace with function body.
	any_button_pressed()

func button4_pressed():
	print("aduete")
	any_button_pressed()

func button5_pressed():
	print("aduete") 
	any_button_pressed()

func button6_pressed():
	print("aduete")
	any_button_pressed()
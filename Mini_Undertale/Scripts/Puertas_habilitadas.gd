extends Node
var datos_puertas: Dictionary

func inicializar_puertas():
	#Creo el nuevo archivo json donde se sobreescribiran los datos de las puertas
	#(si está habilitada o no) dentro del directorio creado anteriormente
	var puertas = File.new()
	puertas.open("user://Puertas habilitadas/Puertas.json", File.WRITE)
	
	#Creo una variable donde almaceno el estado inicial de las puertas
	var puertas_guardadas = datos_puertas
	
	#Almaceno el estado inicial de las puertas
	puertas.store_line(to_json(puertas_guardadas))
	puertas.close()
	

func _ready():
	#Crea un directorio para almacenar el nuevo archivo Json si no existe aun
	var ruta = Directory.new() 
	if not(ruta.dir_exists("user://Puertas habilitadas")):
		ruta.open("user://")
		ruta.make_dir("user://Puertas habilitadas")
	
	#Lee un archivo Json con los estados iniciales de las puertas
	var puertas_iniciales = File.new()
	puertas_iniciales.open("res://Scripts/Guardado de puertas/Puertas.json", File.READ)
	datos_puertas = JSON.parse(puertas_iniciales.get_as_text()).result
	puertas_iniciales.close()
	
	inicializar_puertas()
	


extends "res://SpeechGlobe.gd"

func _ready():
	._ready()

	set_speech_dialogs("neutral", ["Don't move an inch!"])
	
	#Cosas que pueden pasar cuando no lo puedes perdonar
	
	set_speech_dialogs("After_moving",["MOVING?","It moved! It didn't NOT move!"])
	set_speech_dialogs("After_not_moving",["Will it move this time?"])
	
	
	#Cuando esta en un estado donde lo puedes perdonar por x turnos seguidos (xd)

	set_speech_dialogs("spare",["WHAT!!! I'VE BEEN PET!!!"])
	set_speech_dialogs("Spared_1",["WHERE'S THAT COMING FROM!"])
	set_speech_dialogs("Spared_2",["THERE'S NO END TO IT!!"])
	set_speech_dialogs("Spared_3",["WELL, THIS IS THOROUGH!!!"])
	set_speech_dialogs("Spared_4",["OK. That's enough."])

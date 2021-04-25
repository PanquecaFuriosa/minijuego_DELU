extends "res://SpeechGlobe.gd"

func _ready():
	._ready()
	set_speech_dialogs("neutral", ["Did something move?", "I'll make sure it NEVER moves again!"])
	set_speech_dialogs("spare",["WHAT!!! I'VE BEEN PET!!!"])

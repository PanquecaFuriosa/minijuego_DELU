extends "res://SpeechGlobe.gd"

func _ready():
	._ready()
	set_speech_dialogs("neutral", ["Ribbit, ribbit", "Croack, croack", "Hop, hop", "Meow"])
	set_speech_dialogs("compliment", ["Ribbit..."])
	set_speech_dialogs("threat", ["Shiver, Shiver"])

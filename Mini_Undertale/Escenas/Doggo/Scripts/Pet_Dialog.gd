extends "res://SpeechGlobe.gd"

var dialogs = ["PET?","PAT?","POT?"]
export(float) var duration :float = 0.5

func _ready():
	rng.randomize()
	#Decide between one of the three dialogs and show it.
	change_speech(dialogs[rng.randi_range(0, len(dialogs) - 1)])
	animation_player.play("typing_letters2")
	#Dissapear after some time.
	visible = true
	yield(get_tree().create_timer(duration), "timeout")
	call_deferred("queue_free")
	
func _on_Enemy_Turn():
	pass

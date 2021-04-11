extends "res://Escenas/GUI/ActPanel.gd"


func _ready():
	rng.randomize()
	get_parent().connect("player_turn_started", self, "at_turn_beginning")
	enemy_name = "Moldsmal"
	encounter_dialog = "* Moldsmal blocked the way!"
	set_neutral_state(["* Moldsmal waits pensively.", "* Moldsmal burbles quietly.", "* Moldsmal is ruminating.", "* The aroma of lime gelatin wafts through."], ["current"], true)
	#set_neutral_state(["POR QUE DEMONIOS NO LE PONES ASTERISCO"], ["current"], true)
	set_spare_requirement("Flirt", 1)
	set_spare_state(["current"], ["current"])
	play_state(states.get("neutral"))
	

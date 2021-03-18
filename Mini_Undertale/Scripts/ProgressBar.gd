extends HBoxContainer



onready var player = get_node("/root/Fightscene/Player")
onready var Bar = $'ProgressBar'
onready var Number = $'Number'
# Called when the node enters the scene tree for the first time.
func _ready():
	#conectarse a la señal que emite player
	player.get_node('Health').connect('Update_Health',self,'_Player_Update_Health')
	
	#valores iniciales
	Bar.set_max(PlayerVariables.max_hp)
	Bar.set_value(PlayerVariables.current_hp)
	Number.text = str(PlayerVariables.current_hp)

func _Player_Update_Health():
	#actualiza la vida en ehta barra
	Bar.set_value(PlayerVariables.current_hp)
	Number.text = str(PlayerVariables.current_hp)


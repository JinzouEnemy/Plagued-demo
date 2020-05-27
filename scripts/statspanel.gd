extends Panel

onready var hplab = $GridContainer/Label

#función conectada con el player, cuando el hp cambie
#se va a actualizar en el label
func _on_player_hpChanged(cantidad):
	hplab.text = str(cantidad) + "hp"

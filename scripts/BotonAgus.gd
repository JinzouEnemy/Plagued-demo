extends "res://scripts/BotonAccion.gd"

func _on_Button_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node("enemy")
	var player = main.find_node("player")
	if player != null and enemy != null:
		enemy.recivoDamage(20)
		player.acc -= 1

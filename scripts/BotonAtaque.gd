extends "res://scripts/BotonAccion.gd"


func _on_pressed():
	var enemy = battleunits.enemy
	var player = battleunits.player
	if player != null and enemy != null:
		enemy.recivoDamage(6)
		player.acc -= 1

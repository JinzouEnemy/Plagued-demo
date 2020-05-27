extends Button

func _on_atacar_pressed():
	var main = get_tree().current_scene
	var player = main.find_node("player")
	var enemy = main.find_node("enemy")
	if enemy != null and player != null:
		enemy.recivoDamage(player.atk)
		player.acc -= 1

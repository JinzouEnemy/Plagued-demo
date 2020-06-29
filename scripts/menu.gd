extends Control



func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/Battle.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()

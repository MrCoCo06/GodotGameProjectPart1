extends Control


func death():
	
	visible = not visible



func _on_revive_pressed():
	visible = not visible
	get_tree().reload_current_scene()


func _on_exitToMenu_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")

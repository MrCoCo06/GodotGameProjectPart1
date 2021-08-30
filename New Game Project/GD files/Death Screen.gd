extends Control

#When called, makes Death Menu visible and pause every background actions(you can't move player)
func death():
	
	visible = not visible
	get_tree().paused = not get_tree().paused
#When called, restart the scene
func _on_Button_pressed():
	visible = not visible
	get_tree().reload_current_scene()
	get_tree().paused = not get_tree().paused

#when called, player is sent back to main menu
func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")
	get_tree().paused = not get_tree().paused

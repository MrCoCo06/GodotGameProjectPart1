extends Control
# if button is clicked on, it will load the first mission
func _on_firstMission_pressed():
	get_tree().change_scene("res://Scenes/mission1.tscn")
	
#if the button is clicked, it will move back to the first main menu screen
func _on_goBack_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")


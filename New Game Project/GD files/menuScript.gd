extends TextureButton

#Start mission
func _on_start_pressed():
	get_tree().change_scene("res://Scenes/MissionSelect.tscn")

#Close game
func _on_close_pressed():
	get_tree().quit()


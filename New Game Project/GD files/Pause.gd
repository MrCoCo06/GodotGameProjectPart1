extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		visible = not visible
		get_tree().paused = not get_tree().paused
	


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/menu.tscn")


func _on_continue_pressed():
	visible = not visible
	get_tree().paused = not get_tree().paused

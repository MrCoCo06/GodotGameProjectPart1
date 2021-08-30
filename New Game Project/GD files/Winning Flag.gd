extends Area2D

onready var audioPlayer : Node = get_node("/root/Mission #1/Camera2D/AudioPlayer")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		audioPlayer.play_win_sfx()
		yield(get_tree().create_timer(4.0), "timeout")
		get_tree().change_scene("res://Scenes/menu.tscn")

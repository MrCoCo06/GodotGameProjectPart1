extends Area2D

#if function is called, it gives damage to the player. In this case, if the player is hit once, the death screen appears
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.takedamage(100)
		

extends Area2D

export var value : int = 1
var rotationSpeed : float = 90.0

func _process(delta):
	
	rotation_degrees += rotationSpeed * delta

#when call, gives player 1 point and makes coin disappear
func _on_Coin_body_entered(body):
	
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()


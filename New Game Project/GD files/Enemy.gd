extends Area2D

export var speed : int = 100
export var moveDist : int = 300
export var enemy_score : int = 2

onready var startX : int = position.x
onready var targetX : int = position.x + moveDist


func _process(delta):
	
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

#move "current" towards "to" at a rate of "step"
func move_to (current, to, step):
	
	var new = current
	#moving positive?
	if new < to:
		new += step
		
		if new > to:
			new = to
	#moving negative?
	else:
		new -= step
		
		if new < to:
			new = to
	return new

#When called, gives player 2 points for eliminating monster
func _on_Enemy_body_entered(body):
	
	if body.name == "Player":
		body.collect_coin(enemy_score)
		queue_free()
	


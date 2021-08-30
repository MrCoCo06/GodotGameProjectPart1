extends KinematicBody2D


var score : int = 0
var health : int = 100


var speed : int = 200
var jumpForce : int = 1000
var gravity : int = 2000

var jumpcount : int = 0
var vel : Vector2 = Vector2()


onready var deathScreen : Node = get_node("CanvasLayer/DeathScreen")
onready var anim : AnimatedSprite = get_node("ASprite")
onready var ui : Node = get_node("CanvasLayer/UI")
onready var audioPlayer : Node = get_node("/root/Mission #1/Camera2D/AudioPlayer")

func _process(delta):
	vel.x = 0
	
	#movement input 
	
	#move left
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		if Input.is_action_pressed("run"):
			vel.x -= speed /2
		if is_on_floor() == true:
			anim.play("Walking")
		
	
	#move right
	if Input.is_action_pressed("move_right"):
		vel.x +=speed
		if Input.is_action_pressed("run"):
			vel.x += speed /2
		if is_on_floor() == true:
			anim.play("Walking")
		
	
	#jump input
	if is_on_floor():
		jumpcount = 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		anim.play("Jumping")
		vel.y -= jumpForce 
	
	if Input.is_action_just_pressed("jump"):
		jumpcount += 1
	
	if(jumpcount<3) and is_on_floor() == false:
		if Input.is_action_just_pressed("jump"):
			vel.y -= vel.y + jumpForce / 2
		
	
	standing_anim()
	
	#applying the velocity
	vel = move_and_slide(vel, Vector2.UP)

	#gravity
	vel.y += gravity * delta

	#sprite direction
	if vel.x < 0:
		anim.flip_h = true
	elif vel.x > 0:
		anim.flip_h = false
	#if player falls into void, it will return to the beginning
	if position.y >= 1000:
		position = Vector2(50, 450)
	
func takedamage(a):
	health -= a
	if(health > 0):
		ui.set_health_text(health)
	elif(health == 0):
		ui.set_health_text(health)
		deathScreen.death()
	

func collect_coin(value):
	score += value
	ui.set_score_text(score)
	audioPlayer.play_coin_sfx()

func standing_anim():
	if Input.is_action_pressed("move_left") == false and Input.is_action_pressed("move_right") == false and Input.is_action_pressed("jump") == false and is_on_floor():
		anim.play("Standing")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")

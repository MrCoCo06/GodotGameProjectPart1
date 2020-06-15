extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 1000
var gravity : int = 2000


var vel : Vector2 = Vector2()

onready var anim : Sprite = get_node("ASprite")
onready var ui : Node = get_node("/root/MainScene/CanvasLayer/UI")
onready var audioPlayer : Node = get_node("/root/MainScene/Camera2D/AudioPlayer")

func _process(delta):
	vel.x = 0
	
	#movement input 
	
	#move left
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		if Input.is_action_pressed("run"):
			vel.x -= speed /2
		if (anim.animation != "Walking"):
			anim.play("Walking")
	elif Input.is_action_just_released("move_left"):
		anim.animation = "Standing"
	
	#move right
	if Input.is_action_pressed("move_right"):
		vel.x +=speed
		if Input.is_action_pressed("run"):
			vel.x += speed /2
		if is_on_floor() == true:
			anim.play("Walking")
	elif Input.is_action_just_released("move_right"):
		anim.animation = "Standing"
	
		#jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		anim.play("Jumping")
		vel.y -= jumpForce 
	
	
	
	#applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity * get_process_delta_time()
	

	
	#sprite direction
	if vel.x < 0:
		anim.flip_h = true
	elif vel.x > 0:
		anim.flip_h = false
	

func die():
	
	get_tree().reload_current_scene()
	

func collect_coin(value):
	
	score += value
	ui.set_score_text (score)
	audioPlayer.play_coin_sfx()
	


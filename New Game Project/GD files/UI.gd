extends Control

onready var scoreText = get_node("CoinTexture/ScoreText")
onready var healthText = get_node("HealthTexture/HealthText")

func _ready():
	scoreText.text = "0"
	healthText.text = "100"
	

func set_score_text(score):
	
	scoreText.text = str(score)

func set_health_text(health):
	
	healthText.text = str(health)

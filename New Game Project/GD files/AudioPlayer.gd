extends AudioStreamPlayer2D

var coinSFX = preload("res://Audio/coin.ogg")
var winSFX = preload("res://Audio/Recording-_28_.ogg")
func play_coin_sfx():
	
	stream = coinSFX
	play()
	

func play_win_sfx():
	stream = winSFX
	play()

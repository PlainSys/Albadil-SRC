extends Node

var finalesong = load("res://Assets/Music/A_Boss4.wav")

func play_lastsong():
	$song.stream = finalesong
	$song.play()

func _process(_delta):
	if get_tree().current_scene.name == "gameover":
		$song.stop()
	if get_tree().current_scene.name == "sbend":
		$song.stop()
	if get_tree().current_scene.name == "bend":
		$song.stop()
	if get_tree().current_scene.name == "badnedsb":
		$song.stop()
	if get_tree().current_scene.name == "badnedb":
		$song.stop()

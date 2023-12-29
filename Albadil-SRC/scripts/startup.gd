extends Control

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://MainMenu.tscn")

func _on_VideoPlayer_finished():
	get_tree().change_scene("res://MainMenu.tscn")

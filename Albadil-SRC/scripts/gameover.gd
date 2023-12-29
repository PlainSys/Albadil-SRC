extends Control

func _ready():
	$VBoxContainer/return.grab_focus()
	
func save(content):
	var file = File.new()
	file.open("user://score.dat", File.WRITE)
	file.store_var(content)
	file.close()
	
func _on_return_pressed():
	get_tree().change_scene("res://MainMenu.tscn")

func _on_save_pressed():
	save(get_node("/root/Hud/Display/isuckkk").text)

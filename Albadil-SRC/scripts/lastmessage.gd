extends Control

func _ready():
	$VBoxContainer/yes.grab_focus()
	
func save(content):
	var file = File.new()
	file.open("user://score.dat", File.WRITE)
	file.store_var(content)
	file.close()

func _on_yes_pressed():
	save(get_node("/root/Hud/Display/isuckkk").text)
	get_tree().change_scene("res://MainMenu.tscn")

func _on_no_pressed():
	get_tree().change_scene("res://MainMenu.tscn")

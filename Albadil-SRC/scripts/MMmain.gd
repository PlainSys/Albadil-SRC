extends Control

var OP1 = true
var op2 = 2
var op3 = 2
var op4 = true
var op5 = true

var save_path = "user://score.dat"

func save(content):
	var file = File.new()
	file.open("user://score.dat", File.WRITE)
	file.store_var(content)
	file.close()

func load_data():
	var file = File.new()
	file.open("user://score.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func _ready():
	$VBoxContainer/play.grab_focus()

func _on_opt_pressed():
	$options.visible = true

func _on_OP1b_pressed():
	OP1 = not OP1
	
	if OP1 == true:
		$options/OP1b.text = "Shooter-bot"
		$charselect.text = "Character selected: Shooter-bot"
		get_node("/root/Hud").charac = 1
	if OP1 == false:
		$options/OP1b.text = "Bunny"
		$charselect.text = "Character selected: Bunny"
		get_node("/root/Hud").charac = 2

func _on_OP2b_pressed():
	op2 += 1
	
	if op2 >= 4:
		op2 = 1
	if op2 <= 0:
		op2 = 3
	
	if op2 == 1:
		$options/OP2b.text = "Easy"
		$selecteddiff.text = "Difficulty selected: Easy"
		get_node("/root/Hud").diff = 1
	if op2 == 2:
		$options/OP2b.text = "Normal"
		$selecteddiff.text = "Difficulty selected: Normal"
		get_node("/root/Hud").diff = 2
	if op2 == 3:
		$options/OP2b.text = "Hard"
		$selecteddiff.text = "Difficulty selected: Hard"
		get_node("/root/Hud").diff = 3
	if op2 == 4:
		$options/OP2b.text = "Insane"
		$selecteddiff.text = "Difficulty selected: Insane"
		get_node("/root/Hud").diff = 4

func _on_close_pressed():
	$options.visible = false

func _on_quit_pressed():
	get_tree().quit()


func _on_OP3B_pressed():
	op3 += 1
	
	if op3 >= 5:
		op3 = 0
	
	if op3 == 0:
		$options/OP3B.text = "0"
		get_node("/root/Hud").menulife = 0
	if op3 == 1:
		$options/OP3B.text = "1"
		get_node("/root/Hud").menulife = 1
	if op3 == 2:
		$options/OP3B.text = "2"
		get_node("/root/Hud").menulife = 2
	if op3 == 3:
		$options/OP3B.text = "3"
		get_node("/root/Hud").menulife = 3
	if op3 == 4:
		$options/OP3B.text = "4"
		get_node("/root/Hud").menulife = 4

func _on_play_pressed():
	if get_node("/root/Hud").charac == 1:
		$Timer.start()
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://startp2.tscn")


func _on_Timer_timeout():
	$Timer.stop()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://startp1.tscn")


func _on_OP4B_pressed():
	op4 = not op4
	if op4 == true:
		$options/OP4B.text = "On"
		get_node("/root/Hud").epilepsy = true
	if op4 == false:
		$options/OP4B.text = "Off"
		get_node("/root/Hud").epilepsy = false

func _on_OP5B_pressed():
	op5 = not op5
	if op5 == true:
		$options/OP5B.text = "Yes"
		get_node("/root/Hud").contines = true
	if op5 == false:
		$options/OP5B.text = "No"
		get_node("/root/Hud").contines = false

func _input(event):
	if event.is_action_pressed("viewscore"):
		$"reminder lol".visible = false
		$highscore2.show()
		$highscore.hide()
		$highscore2.text = "Highest score: " + load_data()
	if event.is_action_pressed("secret"):
		get_tree().change_scene("res://secret.tscn")

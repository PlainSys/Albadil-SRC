extends Control

func _on_Timer_timeout():
	get_tree().change_scene("res://Stage1B.tscn")

func _ready():
	get_node("/root/Hud").health = 0
	if get_node("/root/Hud").menulife == 0:
		get_node("/root/Hud").health += 0
	elif get_node("/root/Hud").menulife == 1:
		get_node("/root/Hud").health += 1
	elif get_node("/root/Hud").menulife == 2:
		get_node("/root/Hud").health += 2
	elif get_node("/root/Hud").menulife == 3:
		get_node("/root/Hud").health += 3
	elif get_node("/root/Hud").menulife == 4:
		get_node("/root/Hud").health += 4

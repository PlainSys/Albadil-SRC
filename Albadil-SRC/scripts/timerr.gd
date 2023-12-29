extends Label

var CD = 100

func _on_cd_timeout():
	CD -= 1
	if CD <= 0:
		if get_node("/root/Hud").diff == 1:
			get_node("/root/Hud").health += 2
			get_node("/root/Hud").canon = 3
			get_node("/root/Hud").speeed = 30
		else:
			get_node("/root/Hud").health += 1
			get_node("/root/Hud").canon = 3
			get_node("/root/Hud").speeed = 30
		get_tree().change_scene("res://stage4.tscn")
	
func _physics_process(delta):
	$countdown2.set_text(str(CD))

func _ready():
	if get_node("/root/Hud").diff == 1:
		CD = 90
	if get_node("/root/Hud").diff == 2:
		CD = 100
	if get_node("/root/Hud").diff == 3:
		CD = 110

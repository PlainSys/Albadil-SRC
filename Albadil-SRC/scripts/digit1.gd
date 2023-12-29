extends Enemy


func _physics_process(delta):
	if get_node("/root/Hud").diff == 1:
		verticalSpeed = 60
	if get_node("/root/Hud").diff == 2:
		verticalSpeed = 68
	if get_node("/root/Hud").diff == 3:
		verticalSpeed = 75

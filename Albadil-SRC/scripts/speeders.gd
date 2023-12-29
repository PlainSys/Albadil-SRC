extends Enemy

func _physics_process(delta):
	if get_node("/root/Hud").diff == 1:
		verticalSpeed = 200
	if get_node("/root/Hud").diff == 2: #default cooldown but i succ at coding
		verticalSpeed = 270
	if get_node("/root/Hud").diff == 3:
		verticalSpeed = 400

extends Enemy

onready var cooldown := $cooldown
export var firerate := 1.0

func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)
		
	if get_node("/root/Hud").diff == 1:
		firerate = 1.5
	if get_node("/root/Hud").diff == 2:
		firerate = 1.0
	if get_node("/root/Hud").diff == 3:
		firerate = 0.5

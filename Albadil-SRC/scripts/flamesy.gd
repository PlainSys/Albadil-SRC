extends Enemy

onready var cooldown := $cooldown
export var firerate := 1.5

func _process(delta):
	if cooldown.is_stopped():
		$shoot.play()
		fire()
		cooldown.start(firerate)

func _on_flamesy_area_entered(area):
	if area.name == "bullet":
		health -= 15
	if area.name == "slash":
		health -= 15
	if health <= 0:
		get_node("/root/Hud").kill += 1
		get_node("/root/Hud").score += setscore
		queue_free()

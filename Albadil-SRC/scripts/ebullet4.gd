extends Area2D

export var speed:float = 300

func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_ebullet_area_entered(area):
	if area.name == "bullet":
		queue_free()
		get_node("/root/Hud").score += 1
	if area.name == "slash":
		queue_free()
		get_node("/root/Hud").score += 1
	if area.name == "p1hitbox":
		get_node("/root/Hud").health -= 1
		queue_free()
	if area.name == "p2hitbox":
		get_node("/root/Hud").health -= 1
		queue_free()

func _on_ebullet_body_entered(body):
	if body.name == "enemyshieldlol":
		queue_free()

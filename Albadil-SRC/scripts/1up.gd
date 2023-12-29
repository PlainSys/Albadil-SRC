extends Area2D

export var speed:float = 500

func _physics_process(delta):
	position.y += speed * delta

#func _on_1up_body_entered(body):
#	if body.name == "player1":
#		get_node("/root/Hud").health += 1
#		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_1up_area_entered(area):
	if area.name == "p1hitbox":
		$sound.play()
		get_node("/root/Hud").health += 1
		queue_free()
	if area.name == "p2hitbox":
		$sound.play()
		get_node("/root/Hud").health += 1
		queue_free()

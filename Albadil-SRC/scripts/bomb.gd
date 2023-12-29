extends Area2D

export var speed:float = 600

func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bomb_area_entered(area):
	if area.name == "bullet":
		$Sprite.play("ex")
		get_node("/root/Hud").score += 5
		$Timer.start()
		$CollisionShape2D.set_deferred("disabled", true)
		$explosion.play()
	if area.name == "slash":
		$Sprite.play("ex")
		get_node("/root/Hud").score += 5
		$Timer.start()
		$CollisionShape2D.set_deferred("disabled", true)
		$explosion.play()
	if area.name == "p1hitbox":
		$Sprite.play("ex")
		get_node("/root/Hud").health -= 1
		$Timer.start()
		$explosion.play()
	if area.name == "p2hitbox":
		$Sprite.play("ex")
		get_node("/root/Hud").health -= 1
		$Timer.start()
		$explosion.play()

func _on_Timer_timeout():
	queue_free()

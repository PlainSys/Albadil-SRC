extends KinematicBody2D

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += 5.5
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_death2_timeout():
	queue_free()

func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		$death.play("lorbdeath")
		$death2.start()
		$hitbox/CollisionShape2D.set_deferred("disabled", true)


func _on_hitbox_body_entered(body):
	if body.name == "player1":
		get_node("/root/Hud").health -= 1

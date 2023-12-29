extends KinematicBody2D

var velocity = Vector2()

func _ready():
	$idle.play("idle")
	
func _physics_process(delta):
	velocity.y += 5.5
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_deathtimer_timeout():
	queue_free()

func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		$death.play("death")
		$death3.play()
		$death3.play()
		$deathtimer.start()
		$hitbox/CollisionShape2D.set_deferred("disabled", true)
	if area.name == "slash":
		$death.play("death")
		$death3.play()
		$death3.play()
		$deathtimer.start()
		$hitbox/CollisionShape2D.set_deferred("disabled", true)

func _on_hitbox_body_entered(body):
	if body.name == "player1":
		get_node("/root/Hud").health -= 1
	if body.name == "player2":
		get_node("/root/Hud").health -= 1

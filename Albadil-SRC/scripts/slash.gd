extends Area2D

const SPEED = 450
var velocity = Vector2()
var direction = -1

var firstime = false

func _physics_process(delta):
	velocity.y = SPEED * delta * direction
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func set_bullet_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true
		
func _on_slash_area_entered(area):
	if area.is_in_group("damage"):
		var bulletEffect = 0
		if get_node("/root/Hud").canon == 1:
			area.damage(6)
		if get_node("/root/Hud").canon == 2:
			area.damage(11)
		if get_node("/root/Hud").canon == 3:
			area.damage(20)
	if area.name == "ebullet":
		pass
	if area.name == "dbullet":
		pass
	if area.name == "ljhitbox":
		if firstime == false:
			$CollisionShape2D.set_deferred("disabled", false)
			firstime = true
		else:
			$CollisionShape2D.set_deferred("disabled", true)
			queue_free()
	else:
		queue_free()

func _on_slash_body_entered(body):
	if body.name == "enemyshieldlol":
		queue_free()

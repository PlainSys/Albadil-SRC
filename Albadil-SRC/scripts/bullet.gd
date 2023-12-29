extends Area2D

const SPEED = 500
var velocity = Vector2()
var direction = -1
var firstime = false

func _physics_process(delta):
	velocity.y = SPEED * delta * direction
	translate(velocity)
	
func _on_bullet_body_entered(body):
	if body.name == "enemyshieldlol":
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func set_bullet_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true
		
func _on_bullet_area_entered(area):
	if area.is_in_group("damage"):
		var bulletEffect = 0
		if get_node("/root/Hud").canon == 1:
			area.damage(5)
		if get_node("/root/Hud").canon == 2:
			area.damage(10)
		if get_node("/root/Hud").canon == 3:
			area.damage(15)
	if area.name == "ljhitbox":
		if firstime == false:
			$CollisionShape2D.set_deferred("disabled", false)
			firstime = true
		else:
			$CollisionShape2D.set_deferred("disabled", true)
			queue_free()
	else:
		queue_free()

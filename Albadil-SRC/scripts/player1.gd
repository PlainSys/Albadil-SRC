extends KinematicBody2D

export (int) var speed = 560

const BULLET = preload("res://bullet.tscn")

var velocity = Vector2()

func _ready():
	$idle.play("idle")
	
func get_input():
	var running = false
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		$walk.play("walk")
		$Sprite.flip_h = false
		velocity.x += 1
		running = true
		$walk.play()
		if sign($Muzzle.position.y) == 1:
			$Muzzle.position.y *= 1
	elif Input.is_action_pressed("ui_left"):
		$walk.play("walk")
		$Sprite.flip_h = true
		velocity.x -= 1
		running = true
		$walk.play()
		if sign($Muzzle.position.y) == 1:
			$Muzzle.position.y *= -1	
	if Input.is_action_pressed("ui_down"):
		$walk.play("walk")
		velocity.y += 1
		running = true
		$walk.play()
	elif Input.is_action_pressed("ui_up"):
		$walk.play("walk")
		velocity.y -= 1
		running = true
		$walk.play()
		
	if !running:
		$idle.play("idle")
		$walk.stop()
		
	if Input.is_action_just_pressed("attack"):
		$attack.play("attack")
		$gun.play()
		$Delay.start()
		
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if get_node("/root/Hud").health <= -1:
		if get_node("/root/Hud").contines == true:
			$p1hitbox/CollisionShape2D.set_deferred("disabled", true)
			$isuck.start()
			
	if get_node("/root/Hud").boss4beat == true:
		$p1hitbox/CollisionShape2D.set_deferred("disabled", true)
			
	if get_node("/root/Hud").speeed == 20:
		speed = 590
	if get_node("/root/Hud").speeed == 30:
		speed = 620

func _on_Delay_timeout():
	$Delay.stop()
	var bullet = BULLET.instance()
	if sign($Muzzle.position.y) == 1:
		bullet.set_bullet_direction(1)
	else:
		bullet.set_bullet_direction(-1)
	get_parent().add_child(bullet)
	bullet.position = $Muzzle.global_position

func _on_isuck_timeout():
	$CollisionShape2D.set_deferred("disabled", false)

func _on_invinc_timeout():
	$p1hitbox/CollisionShape2D.set_deferred("disabled", false)
	$forcefield.hide()

func _on_p1hitbox_area_entered(area):
	if area.name == "invinc":
		$invinc.start()
		$invinc2.play()
		$forcefield.show()
		$p1hitbox/CollisionShape2D.set_deferred("disabled", true)

func _on_walk_animation_finished(anim_name):
	$idle.play("idle")
	
func _on_stupidanimting_timeout():
	$walk.stop()

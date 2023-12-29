extends KinematicBody2D

export (int) var speed = 600

const BULLET = preload("res://slash.tscn")

var velocity = Vector2()
var attack = true

func _ready():
	$idle.play("idle")

func get_input():
	var running = false
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		$walk.play("walk")
		$Sprite.flip_h = false
		running = true
		velocity.x += 1
		if sign($muzzle.position.y) == 1:
			$muzzle.position.y *= 1
	elif Input.is_action_pressed("ui_left"):
		$walk.play("walk")
		$Sprite.flip_h = true
		running = true
		velocity.x -= 1
		if sign($muzzle.position.y) == 1:
			$muzzle.position.y *= -1
	if Input.is_action_pressed("ui_down"):
		$walk.play("walk")
		velocity.y += 1
		running = true
	elif Input.is_action_pressed("ui_up"):
		$walk.play("walk")
		velocity.y -= 1
		running = true
	if !running:
		$idle.play("idle")
		$walk.stop()
	if Input.is_action_just_pressed("attack"):
		if attack == true:
			$slash.play()
			$attack.play("attack")
			$cooldown.start()
		else:
			$attack.stop()
			$cooldown.stop()
		
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if get_node("/root/Hud").health <= -1:
		if get_node("/root/Hud").contines == true:
			$p2hitbox/CollisionShape2D.set_deferred("disabled", true)
			$isuck.start()
			
	if get_node("/root/Hud").boss4beat == true:
		$p2hitbox/CollisionShape2D.set_deferred("disabled", true)
			
	if get_node("/root/Hud").speeed == 60:
		speed = 630
	if get_node("/root/Hud").speeed == 70:
		speed = 660

func _on_isuck_timeout():
	$CollisionShape2D.set_deferred("disabled", false)

func _on_invinc_timeout():
	$p2hitbox/CollisionShape2D.set_deferred("disabled", false)
	$forcefield.hide()

func _on_p2hitbox_area_entered(area):
	if area.name == "invinc":
		$invinc.start()
		$invinc2.play()
		$forcefield.show()
		$p2hitbox/CollisionShape2D.set_deferred("disabled", true)

func _on_attack_animation_finished(anim_name):
	$attack.stop()

func _on_cooldown_timeout():
	$attack.stop()
	$cooldown.stop()
	$delay.start()
	var bullet = BULLET.instance()
	if sign($muzzle.position.y) == 1:
		bullet.set_bullet_direction(1)
	else:
		bullet.set_bullet_direction(-1)
	get_parent().add_child(bullet)
	bullet.position = $muzzle.global_position

func _on_delay_timeout():
	$delay.stop()
	$lastdelay.start()
	attack = false

func _on_lastdelay_timeout():
	$lastdelay.stop()
	attack = true

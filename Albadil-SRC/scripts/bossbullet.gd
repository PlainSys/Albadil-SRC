extends Area2D

export var speed:float = 500
var readyy = false
		
func _physics_process(delta):
	position.y += speed * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bossbullet_area_entered(area):
	if area.name == "bullet":
		queue_free()
		get_node("/root/Hud").score += 1
	if area.name == "slash":
		queue_free()
		get_node("/root/Hud").score += 1

func _on_bossbullet_body_entered(body):
	if body.name == "player1":
		get_node("/root/Hud").health -= 1
	if body.name == "player2":
		get_node("/root/Hud").health -= 1

func _on_Timer_timeout():
	$Timer.stop()

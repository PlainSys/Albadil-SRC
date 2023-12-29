extends Area2D

export var verticalSpeed := 10.0

func _physics_process(delta):
	position.y += verticalSpeed * delta

func _on_ghost_body_entered(body):
	if body.name == "player1":
		get_node("/root/Hud").health -= 1
	if body.name == "player2":
		get_node("/root/Hud").health -= 1

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

extends Area2D

export var speed:float = 600

func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_invinc_area_entered(area):
	if area.name == "p1hitbox":
		queue_free()
	if area.name == "p2hitbox":
		queue_free()

extends Area2D

func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		get_node("/root/Hud").score += 5
		get_node("/root/Hud").kill += 1
	if area.name == "slash":
		get_node("/root/Hud").score += 5
		get_node("/root/Hud").kill += 1

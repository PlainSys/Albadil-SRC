extends Area2D

func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		get_node("/root/Hud").score += 500
	if area.name == "slash":
		get_node("/root/Hud").score += 500

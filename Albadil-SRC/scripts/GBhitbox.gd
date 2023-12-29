extends "res://Scripts/HUD.gd"

func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		get_node("/root/Hud").score += 100
	if area.name == "slash":
		get_node("/root/Hud").score += 100

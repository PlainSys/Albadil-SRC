extends Area2D

func _on_sword_area_entered(area):
	if area.is_in_group("damage"):
		if get_node("/root/Hud").canon == 1:
			area.damage(7)
		if get_node("/root/Hud").canon == 2:
			area.damage(12)
		if get_node("/root/Hud").canon == 3:
			area.damage(18)
	queue_free()

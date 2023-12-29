extends Area2D

func _on_lightsource_area_entered(area):
	if area.name == "bullet":
		#$cooldown.start()
		$source/CollisionShape2D.set_deferred("disabled", false)


func _on_cooldown_timeout():
	$cooldown.stop()
	$source/CollisionShape2D.set_deferred("disabled", true)

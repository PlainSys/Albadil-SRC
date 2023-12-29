extends Node2D

var kinfeoda := preload("res://knife.tscn")

	
func _physics_process(delta):
	if get_node("/root/Hud").boss4beat == true:
		if get_node("/root/Hud").epilepsy == true:
			$explosion.play()
			$flash.show()
			$ending.play("ending")
		else:
			if get_node("/root/Hud").continuesused == true:
				get_tree().change_scene("res://badnedb.tscn")
			else:
				get_tree().change_scene("res://bend.tscn")

func _on_shieldcooldown_timeout():
	var viewRect = get_viewport_rect()
	var xPos := rand_range(viewRect.position.x, viewRect.end.x)
	var knife := kinfeoda.instance()
	knife.position = Vector2(xPos, position.y)
	get_tree().current_scene.add_child(knife)
	$shieldcooldown.stop()
	$cd2.start()
	$enemyshieldlol/ColorRect.show()
	$enemyshieldlol/CollisionShape2D.set_deferred("disabled", false)

func _on_cd2_timeout():
	$shieldcooldown.start()
	$cd2.stop()
	$enemyshieldlol/ColorRect.hide()
	$enemyshieldlol/CollisionShape2D.set_deferred("disabled", true)

func _on_ending_animation_finished(anim_name):
	if get_node("/root/Hud").continuesused == true:
		get_tree().change_scene("res://badnedb.tscn")
	else:
		get_tree().change_scene("res://bend.tscn")


func _on_orangetime_timeout():
	if get_node("/root/Hud").diff == 3:
		$orangetime.stop()
		$orangetime2.start()
		$orangeting/ColorRect.show()
		$orangeting/CollisionShape2D.set_deferred("disabled", false)
	else:
		pass

func _on_orangetime2_timeout():
	if get_node("/root/Hud").diff == 3:
		$orangetime2.stop()
		$orangetime.start()
		$orangeting/ColorRect.hide()
		$orangeting/CollisionShape2D.set_deferred("disabled", true)
	else:
		pass

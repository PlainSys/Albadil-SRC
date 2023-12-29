extends Node2D


func _ready():
	$longjim/AnimationPlayer.play("lazymovement")
	
	if get_node("/root/Hud").epilepsy == true:
		pass
	else:
		$flash.hide()
	
func _physics_process(delta):
	if get_node("/root/Hud").boss2beat == true:
		$transition.show()
		$trans.play("trans")

func _on_lightsource_area_entered(area):
	if area.name == "bullet":
		$light.play()
		$lightsource/cooldown.start()
		$source/CollisionShape2D.set_deferred("disabled", false)
	if area.name == "slash":
		$light.play()
		$lightsource/cooldown.start()
		$source/CollisionShape2D.set_deferred("disabled", false)


func _on_cooldown_timeout():
	$lightsource/cooldown.stop()
	$source/CollisionShape2D.set_deferred("disabled", true)


func _on_flasht_timeout():
	$flash.hide()


func _on_Timer_timeout():
	$transition.hide()
	$trans.stop()

func _on_trans_animation_finished(anim_name):
	$transition.hide()
	get_tree().change_scene("res://st2endb.tscn")

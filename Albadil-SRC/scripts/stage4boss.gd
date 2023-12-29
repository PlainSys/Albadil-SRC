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
				get_tree().change_scene("res://badnedsb.tscn")
			else:
				get_tree().change_scene("res://sbend.tscn")

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
		get_tree().change_scene("res://badnedsb.tscn")
	else:
		get_tree().change_scene("res://sbend.tscn")


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

#func update_activity() -> void:
#	var activity = Discord.Activity.new()
#	activity.set_type(Discord.ActivityType.Playing)
#	if get_node("/root/Hud").diff == 1:
#		activity.set_state("Current Difficulty: Easy")
#	if get_node("/root/Hud").diff == 2:
#		activity.set_state("Current Difficulty: Normal")
#	if get_node("/root/Hud").diff == 3:
#		activity.set_state("Current Difficulty: Hard")
#	activity.set_details("On Final boss")
#
#	var assets = activity.get_assets()
#	assets.set_large_image("icon")
#	assets.set_large_text("random ixon I made in paintdotnetlol")
#	assets.set_small_image("capsule_main")
#	assets.set_small_text("ZONE 2 WOOO")
#
#	var timestamps = activity.get_timestamps()
#	timestamps.set_start(OS.get_unix_time() + 100)
#	timestamps.set_end(OS.get_unix_time() + 500)
#
#	var result = yield(Discord.activity_manager.update_activity(activity), "result").result
#	if result != Discord.Result.Ok:
#		push_error(str(result))

extends Node2D


func _ready():
	if get_node("/root/Hud").epilepsy == true:
		$flash.play("flash")
		$Timer.start()
	else:
		$background1.hide()
		$Timer.start()
	
	if get_node("/root/Hud").boss1beat == true:
		$transition.show()
		$AnimationPlayer2.play("trans")

func _physics_process(delta):
	if get_node("/root/Hud").boss1beat == true:
		$transition.show()
		$AnimationPlayer2.play("trans")
		$Timer2.start()
		
func _on_Timer_timeout():
	$flash.stop()
	$Timer.stop()
	$stopflash.play("stop")
	$AnimationPlayer.play("bossbeginning")
	$cutsceneaudio.play()
	$bossbegin.start()

func _on_bossbegin_timeout():
	$bossbegin.stop()
	$propig.visible = false
	$theme.play()
	$deilquilo.show()
	$bossloopcauseisucc.play("loop")


func _on_AnimationPlayer2_animation_finished(anim_name):
	$transition.hide()
	get_tree().change_scene("res://st1end.tscn")


func _on_Timer2_timeout():
	$transition.hide()
	$AnimationPlayer2.stop()

#func update_activity() -> void:
#	var activity = Discord.Activity.new()
#	activity.set_type(Discord.ActivityType.Playing)
#	if get_node("/root/Hud").diff == 1:
#		activity.set_state("Current Difficulty: Easy")
#	if get_node("/root/Hud").diff == 2:
#		activity.set_state("Current Difficulty: Normal")
#	if get_node("/root/Hud").diff == 3:
#		activity.set_state("Current Difficulty: Hard")
#	activity.set_details("On the first boss wow")
#
#	var assets = activity.get_assets()
#	assets.set_large_image("icon")
#	assets.set_large_text("ZONE 2 WOOO")
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
#

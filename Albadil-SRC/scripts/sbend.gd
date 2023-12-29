extends Control


func _ready():
	$AnimationPlayer.play("transition")


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()
	$ending.play("theend")


func _on_Timer_timeout():
	$Timer.stop()
	$song.play()


func _on_ending_animation_finished(anim_name):
	get_tree().change_scene("res://credits.tscn")

#func update_activity() -> void:
#	var activity = Discord.Activity.new()
#	activity.set_type(Discord.ActivityType.Playing)
#	if get_node("/root/Hud").diff == 1:
#		activity.set_state("Played on Easy | Played using Shooterbot")
#	if get_node("/root/Hud").diff == 2:
#		activity.set_state("Played on Normal | Played using Shooterbot")
#	if get_node("/root/Hud").diff == 3:
#		activity.set_state("Played on Hard- wait... this chad. | Played using Shooterbot")
#	activity.set_details("Man actually 1cc'd the game")
#
#	var assets = activity.get_assets()
#	assets.set_large_image("icon")
#	assets.set_large_text("random ixon I made in paintdotnetlol")
#	assets.set_small_image("capsule_main")
#	assets.set_small_text("a")
#
#	var timestamps = activity.get_timestamps()
#	timestamps.set_start(OS.get_unix_time() + 100)
#	timestamps.set_end(OS.get_unix_time() + 500)
#
#	var result = yield(Discord.activity_manager.update_activity(activity), "result").result
#	if result != Discord.Result.Ok:
#		push_error(str(result))

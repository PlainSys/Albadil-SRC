extends Node2D

var enemy2 = preload("res://bomb.tscn")

var character = 1
var Test = "123"

var discordtestting = "Normal"

func _ready():
	$AnimationPlayer.play("stage")
	if get_node("/root/Hud").charac == 1:
		character = 1
	else:
		character = 2
		
	if character == 1:
		$char.text = "Shooter-bot"
		$char.add_color_override(Test, Color(69,1,10,1))
		##$char.modulate = Color(69, 182, 243)
	if character == 2:
		$char.text = "Bunny"


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()

#func update_activity() -> void:
#	var activity = Discord.Activity.new()
#	activity.set_type(Discord.ActivityType.Playing)
#	if get_node("/root/Hud").diff == 1:
#		activity.set_state("Current Difficulty: Easy")
#	if get_node("/root/Hud").diff == 2:
#		activity.set_state("Current Difficulty: Normal")
#	if get_node("/root/Hud").diff == 3:
#		activity.set_state("Current Difficulty: Hard")
#	activity.set_details("On Stage 1")
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
		
func _on_Spawntimer_timeout():
	if get_node("/root/Hud").diff == 3:
		var Enemyy2 = enemy2.instance()
		add_child(Enemyy2)
		Enemyy2.position = $Spawn.position
		
		var nodes = get_tree().get_nodes_in_group("spawn")
		var node = nodes[randi() % nodes.size()]
		var Position = node.position
		$Spawn.position = Position
	else:
		pass

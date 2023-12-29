extends Node2D

var enemy = preload("res://flamesy.tscn")

func _ready():
	$AnimationPlayer.play("stagee")
	if get_node("/root/Hud").epilepsy == false:
		$flash.hide()

func _on_Timer_timeout():
	$flash.hide()


func _on_Spawntimer_timeout():
	if get_node("/root/Hud").diff == 3:
		var Enemyy = enemy.instance()
		add_child(Enemyy)
		Enemyy.position = $Spawn.position
		
		var nodes = get_tree().get_nodes_in_group("spawn")
		var node = nodes[randi() % nodes.size()]
		var Position = node.position
		$Spawn.position = Position
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
#	activity.set_details("On Final Stage")
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

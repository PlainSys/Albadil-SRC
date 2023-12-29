extends Control


func _ready():
	MusicController.play_lastsong()
	if get_node("/root/Hud").epilepsy == true:
		$AnimationPlayer.play("epilepsyyy")
	else:
		$AnimationPlayer.stop()
	$visibilty.play("vis")

func _on_Timer_timeout():
	get_tree().change_scene("res://stage4boss.tscn")

extends Control

func _ready():
	$endingtrans.play("trns")
	$fog.play("fog")
		
func _on_endingtrans_animation_finished(anim_name):
	$endingtrans.stop()

func _on_fog_animation_finished(anim_name):
	$fog.stop()
	$AnimationPlayer.play("rolldatext")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://lastmessage.tscn")
	$AnimationPlayer.stop()

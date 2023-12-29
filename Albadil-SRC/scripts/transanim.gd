extends ColorRect

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()

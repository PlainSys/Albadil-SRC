extends Node2D


func _ready():
	$AnimationPlayer.play("stagee")

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()
	

extends Node2D


func _ready():
	$AnimationPlayer.play("stagee")

func _on_Timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$fog2.hide()
	$fog.show()

func _on_Timer2_timeout():
	$Timer.start()
	$Timer2.stop()
	$fog2.show()
	$fog.hide()


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()

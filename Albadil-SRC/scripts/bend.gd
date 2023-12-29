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
	get_tree().change_scene("res://creditsb.tscn")


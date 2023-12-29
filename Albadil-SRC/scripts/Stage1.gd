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


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()
		
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

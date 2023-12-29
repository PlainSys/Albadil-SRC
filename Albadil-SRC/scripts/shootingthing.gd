extends Area2D

var plBullet := preload("res://ebullet2.tscn")
onready var firingPositions := $FiringPosition
onready var cooldown := $cooldown
export var firerate := 1.0

func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instance()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
		
func _process(delta):
	##$AnimationPlayer.play("hover")
	if get_node("/root/Hud").diff == 3:
		$Sprite.show()
	else:
		$Sprite.hide()
		$CollisionShape2D.set_deferred("disabled", true)	
	if cooldown.is_stopped():
		if get_node("/root/Hud").diff == 3:
			fire()
			cooldown.start(firerate)
		else:
			pass

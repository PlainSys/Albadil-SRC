extends KinematicBody2D
#modified code of Suicbot

export var health: int = 100
export var setscore: int = 500

var plBullet := preload("res://bossbullet.tscn")

onready var firingPositions := $FiringPosition
onready var cooldown := $cooldown
export var firerate := 0.4

var begin = false

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	if health <= 0:
		get_node("/root/Hud").score += setscore
		queue_free()

func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instance()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
		
func _process(delta):
	if get_node("/root/Hud").diff == 1:
		firerate = 1
	if get_node("/root/Hud").diff == 2:
		firerate = 0.4
	if get_node("/root/Hud").diff == 3:
		firerate = 0.2
	if cooldown.is_stopped():
		if begin == true:
			fire()
			cooldown.start(firerate)
		else:
			pass


func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		health -= 5
		get_node("/root/Hud").score += 5
	if area.name == "slash":
		health -= 5
		get_node("/root/Hud").score += 5
	if health <= 0:
		get_node("/root/Hud").boss1beat = true
		get_node("/root/Hud").speeed = 20
		get_node("/root/Hud").canon = 2
		get_node("/root/Hud").score += setscore
		queue_free()


func _on_Timer_timeout():
	begin = true

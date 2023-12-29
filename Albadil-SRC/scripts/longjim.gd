extends KinematicBody2D

export var health: int = 5
export var setscore: int = 500

var plBullet := preload("res://bossbullet.tscn")

export var firerate := 0.4

var begin = false

var firstime = false

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	if health <= 0:
		get_node("/root/Hud").score += setscore
		queue_free()


func _on_hitbox_area_entered(area):
	if area.name == "source":
		health -= 1
		$shine.play()
	
	if health <= 0:
		get_node("/root/Hud").boss2beat = true
		get_node("/root/Hud").score += setscore
		queue_free()


func _on_ljhitbox_area_entered(area):
	var firsttime = false
	if area.name == "source":
		health -= 1
		$shine.play()
	if health <= 0:
		get_node("/root/Hud").boss2beat = true
		get_node("/root/Hud").score += setscore
		queue_free()

extends KinematicBody2D

export var health: int = 800
export var setscore: int = 1000

var plBullet := preload("res://ebullet4.tscn")
var plBullet2 := preload("res://ebullet3.tscn")
var plBullet3 := preload("res://ebullet2.tscn")

onready var firingPositions := $FiringPosition
onready var firingPositions2 := $fire2
onready var cooldown := $cooldown
onready var cooldown2 := $Timer
export var firerate := 1.0
export var firerate2 := 1.0

func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instance()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)

func fire2():
	for child in firingPositions2.get_children():
		var bullet3 := plBullet3.instance()
		bullet3.global_position = child.global_position
		get_tree().current_scene.add_child(bullet3)
		
		var bullet2 := plBullet2.instance()
		bullet2.global_position = child.global_position
		get_tree().current_scene.add_child(bullet2)
		
func _process(delta):
	if cooldown.is_stopped():
		fire2()
		fire()
		cooldown.start(firerate)
		
	if get_node("/root/Hud").diff == 1:
		firerate = 1.3
	if get_node("/root/Hud").diff == 2: #default cooldown but i succ at coding
		firerate = 1.0
	if get_node("/root/Hud").diff == 3:
		firerate = 1.0

func _on_hitbox_area_entered(area):
	if area.name == "bullet":
		health -= 15
		get_node("/root/Hud").score += 20
	if area.name == "slash":
		health -= 15
		get_node("/root/Hud").score += 20
	if health <= 0:
		get_node("/root/Hud").boss4beat = true

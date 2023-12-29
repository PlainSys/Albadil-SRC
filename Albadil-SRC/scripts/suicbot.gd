extends Area2D
class_name Enemy

#Base enemy lol

export var verticalSpeed = 190
export var health: int = 5
export var setscore: int = 100
export var drone: = false

onready var extracooldown := $exlife
export var excd := 5.0

var plBullet := preload("res://ebullet.tscn")
var dBullet := preload("res://dbullet.tscn")

var oneup := preload("res://1up.tscn")
var shield := preload("res://invinc.tscn")

onready var firingPositions := $FiringPosition

func _physics_process(delta):
	position.y += verticalSpeed * delta
	
func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	$hit.play()
	if health <= 0:
		if randf() < 0.2:
			extralife()
		if randf() < 0.15:
			invincting()
		get_node("/root/Hud").kill += 1
		get_node("/root/Hud").score += setscore
		queue_free()
		
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func fire():
	for child in firingPositions.get_children():
		if drone == true:
			var bullet := dBullet.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)
		else:
			var bullet := plBullet.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)

func extralife():
	for child in firingPositions.get_children():
		var extend := oneup.instance() #touhou ref lol
		extend.global_position = child.global_position
		get_tree().current_scene.add_child(extend)
		
func invincting():
	for child in firingPositions.get_children():
		var shieldting := shield.instance() #sonic ref :troll:
		shieldting.global_position = child.global_position
		get_tree().current_scene.add_child(shieldting)

#func _on_suicbot_body_entered(body):
#	if body.name == "player1":
	#	get_node("/root/Hud").health -= 1

func _on_exlife_timeout():
	$exlife.stop()
	extralife()

func _on_suicbot_area_entered(area):
	if area.name == "p1hitbox":
		get_node("/root/Hud").health -= 1
	if area.name == "p2hitbox":
		get_node("/root/Hud").health -= 1

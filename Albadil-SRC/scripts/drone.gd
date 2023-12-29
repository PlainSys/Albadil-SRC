extends Enemy

onready var cooldown := $cooldown
export var firerate := 0.7

func _ready():
	$AnimationPlayer.play("drone")
	if get_node("/root/Hud").diff == 1:
		verticalSpeed = 95
	if get_node("/root/Hud").diff == 2: #default cooldown but i succ at coding
		verticalSpeed = 100
	if get_node("/root/Hud").diff == 3:
		verticalSpeed = 120

func _process(delta):
	if cooldown.is_stopped():
		fire()
		$gunshot.play()
		cooldown.start(firerate)


func _on_drone_area_entered(area):
	if area.name == "explosion":
		$explosion2.play()
		$explosion.show()
		$exp/ex.set_deferred("disabled", false)


func _on_exp_body_entered(body):
	if body.name == "player1":
		get_node("/root/Hud").health -= 1
	if body.name == "player2":
		get_node("/root/Hud").health -= 1

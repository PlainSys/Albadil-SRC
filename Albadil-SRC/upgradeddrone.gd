extends Enemy

onready var cooldown := $cooldown
export var firerate := 0.6

export var horizentalspeed := 50.0
var horizentalDirection: int = 1

func _physics_process(delta):
	position.x += horizentalspeed * delta * horizentalDirection
	
	var viewRect := get_viewport_rect()
	if position.x < viewRect.position.x or position.x > viewRect.end.x:
		horizentalDirection *= -1
		
	if get_node("/root/Hud").diff == 1:
		verticalSpeed = 95
	if get_node("/root/Hud").diff == 2:
		verticalSpeed = 100
	if get_node("/root/Hud").diff == 3:
		verticalSpeed = 120

func _ready():
	$AnimationPlayer.play("drone")

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

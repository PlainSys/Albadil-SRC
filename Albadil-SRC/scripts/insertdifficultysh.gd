extends Area2D


func _ready():
	if get_node("/root/Hud").diff == 1:
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		pass #suck it

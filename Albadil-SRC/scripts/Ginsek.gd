extends KinematicBody2D

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += 0.6
	velocity = move_and_slide(velocity,Vector2.UP)

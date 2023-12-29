extends CanvasLayer

func _ready():
	set_visible(false)
	$VBoxContainer/yes.grab_focus()
	
	if get_node("/root/Hud").health <= -1:
		if get_node("/root/Hud").contines == true:
			set_visible(true)
			get_tree().paused = true
		else:
			get_tree().paused = false
			set_visible(false)

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
		
func _on_yes_pressed():
	get_node("/root/Continue/ColorRect").hide()
	get_node("/root/Continue/Label").hide()
	get_node("/root/Continue/VBoxContainer").hide()
	get_node("/root/Hud").continuesused = true
	get_node("/root/Hud").contines = false
	get_node("/root/Hud").health += 4
	set_visible(false)
	get_tree().paused = false

func _on_no_pressed():
	get_node("/root/Continue/ColorRect").hide()
	get_node("/root/Continue/Label").hide()
	get_node("/root/Continue/VBoxContainer").hide()
	get_node("/root/Hud").continuesused = false
	get_node("/root/Hud").contines = false
	get_node("/root/Hud").health -= 1
	set_visible(false)
	get_tree().paused = false

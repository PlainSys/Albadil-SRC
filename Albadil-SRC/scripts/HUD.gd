extends Node2D

var score = 0 setget set_score #Score 
var health = 0 setget set_health #players lives and not HEALTH
var diff = 2 setget set_diff #difficulty
var contines = true
var continuesused = false
var canon = 1
var speeed = 10
var menulife = 2

var kill = 0 setget set_kill

var maxkill = 0 setget set_maxx

var score_life: int = 0
const ADD_LIFE : int = 10

var charac = 1
onready var _label: Label = get_node("/root/Hud/Display/SCORE")

var boss1beat = false
var boss2beat = false
var boss4beat = false

var epilepsy = true

func add_score_1(add : int) -> void:
	score += add
	while score >= score_life + ADD_LIFE:
		health += 1
		score_life + ADD_LIFE

func _process(_delta):
	get_node("/root/Hud/Display/isuckkk").set_text(" "+str(score).pad_zeros(6))
	
	get_node("/root/Hud/Display/SCORE").show()
	get_node("/root/Hud/Display/LIVES").show()
	get_node("/root/Hud/Display/DIFF").show()
	get_node("/root/Hud/Display/KILL").show()
	get_node("/root/Hud/Display/MAX").show()
	get_node("/root/Hud/Display/border").show()
	get_node("/root/Hud/Display/canon").show()
	get_node("/root/Hud/Display/char").show()
	
	
	if canon == 1:
		get_node("/root/Hud/Display/canon").set_text("Canon: Basic")
	if canon == 2:
		get_node("/root/Hud/Display/canon").set_text("Canon: Better")
	if canon == 3:
		get_node("/root/Hud/Display/canon").set_text("Canon: Ultimate")
	
	if speeed == 10:
		get_node("/root/Hud/Display/speed").set_text("Speed: 10")
		
	if speeed == 20:
		get_node("/root/Hud/Display/speed").set_text("Speed: 20")
		
	if speeed == 30:
		get_node("/root/Hud/Display/speed").set_text("Speed: 30")
		
	if speeed == 50:
		get_node("/root/Hud/Display/speed").set_text("Speed: 50")
		
	if speeed == 60:
		get_node("/root/Hud/Display/speed").set_text("Speed: 60")
		
	if speeed == 70:
		get_node("/root/Hud/Display/speed").set_text("Speed: 70")
		
	if charac == 1:
		get_node("/root/Hud/Display/char").set_text("Shooter-bot")
		speeed = 10
	if charac == 2:
		get_node("/root/Hud/Display/char").set_text("Bunny")
		speeed = 50
	
	if get_tree().current_scene.name == "startup":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
	
	if get_tree().current_scene.name == "menu":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
		get_node("/root/Hud/Display/fogtimer2").stop()
		get_node("/root/Hud/Display/fog1").hide()
		get_node("/root/Hud/Display/fogtimer").stop()
		get_node("/root/Hud/Display/fog2").hide()
		
		health = 2
		score = 0
		canon = 1
		speeed = 10
		boss1beat = false
		boss2beat = false
		boss4beat = false
		kill = 0
		continuesused = false
		
	if get_tree().current_scene.name == "gameover":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
		charac = 1
		
		get_node("/root/Hud/Display/fogtimer2").stop()
		get_node("/root/Hud/Display/fog1").hide()
		get_node("/root/Hud/Display/fogtimer").stop()
		get_node("/root/Hud/Display/fog2").hide()
		
	if get_tree().current_scene.name == "stage1":
		if diff == 1:
			get_node("/root/Hud").maxkill = 10
			if get_node("/root/Hud").kill == 10:
				get_tree().change_scene("res://Stage1boss.tscn")
		if diff == 2:
			get_node("/root/Hud").maxkill = 15
			if get_node("/root/Hud").kill == 15:
				get_tree().change_scene("res://Stage1boss.tscn")
		if diff == 3:
			get_node("/root/Hud").maxkill = 20 ##checks maximum kills
			if get_node("/root/Hud").kill == 20:
				get_tree().change_scene("res://Stage1boss.tscn")
			
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/MAX").show()
		get_node("/root/Hud/Display/KILL").show()
		get_node("/root/Hud/Display/speed").show()
		get_node("/root/Hud/Display/char").show()
		
	if get_tree().current_scene.name == "stage1b":
		if diff == 1:
			get_node("/root/Hud").maxkill = 10
			if get_node("/root/Hud").kill == 10:
				get_tree().change_scene("res://Stage1bossb.tscn")
		if diff == 2:
			get_node("/root/Hud").maxkill = 15
			if get_node("/root/Hud").kill == 15:
				get_tree().change_scene("res://Stage1bossb.tscn")
		if diff == 3:
			get_node("/root/Hud").maxkill = 20
			if get_node("/root/Hud").kill == 20:
				get_tree().change_scene("res://Stage1bossb.tscn")
			
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/MAX").show()
		get_node("/root/Hud/Display/KILL").show()
		get_node("/root/Hud/Display/speed").show()
		get_node("/root/Hud/Display/char").show()
	
	if get_tree().current_scene.name == "boss1":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/MAX").show()
		get_node("/root/Hud/Display/KILL").show()
		
		if boss1beat == true:
			pass
			
	if get_tree().current_scene.name == "boss1b":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/MAX").show()
		get_node("/root/Hud/Display/KILL").show()
		
		if boss1beat == true:
			pass
			
	if get_tree().current_scene.name == "stage2":
		if get_node("/root/Hud").epilepsy == false:
			get_node("/root/Hud/Display/fog1").hide()
			get_node("/root/Hud/Display/fog2").hide()
		else:
			get_node("/root/Hud/Display/fogtimer2").start()
			get_node("/root/Hud/Display/fog1").show()
		
		if diff == 1:
			get_node("/root/Hud").maxkill = 28
			if get_node("/root/Hud").kill == 28:
				get_tree().change_scene("res://stage2boss.tscn")
		if diff == 2:
			get_node("/root/Hud").maxkill = 30
			if get_node("/root/Hud").kill == 30:
				get_tree().change_scene("res://stage2boss.tscn")
		if diff == 3:
			get_node("/root/Hud").maxkill = 50
			if get_node("/root/Hud").kill == 50:
				get_tree().change_scene("res://stage2boss.tscn")
				
	if get_tree().current_scene.name == "stage2b":
		get_node("/root/Hud/Display/fogtimer2").start()
		get_node("/root/Hud/Display/fog1").show()
		
		if diff == 1:
			get_node("/root/Hud").maxkill = 28
			if get_node("/root/Hud").kill == 28:
				get_tree().change_scene("res://stage2bossb.tscn")
		if diff == 2:
			get_node("/root/Hud").maxkill = 30
			if get_node("/root/Hud").kill == 30:
				get_tree().change_scene("res://stage2bossb.tscn")
		if diff == 3:
			get_node("/root/Hud").maxkill = 50
			if get_node("/root/Hud").kill == 50:
				get_tree().change_scene("res://stage2bossb.tscn")
				
	if get_tree().current_scene.name == "st2end":
		get_node("/root/Hud/Display/fogtimer2").stop()
		get_node("/root/Hud/Display/fog1").hide()
		get_node("/root/Hud/Display/fogtimer").stop()
		get_node("/root/Hud/Display/fog2").hide()
		
	if get_tree().current_scene.name == "st2endb":
		get_node("/root/Hud/Display/fogtimer2").stop()
		get_node("/root/Hud/Display/fog1").hide()
		get_node("/root/Hud/Display/fogtimer").stop()
		get_node("/root/Hud/Display/fog2").hide()
		
	if get_tree().current_scene.name == "stage4":
		if diff == 1:
			get_node("/root/Hud").maxkill = 90
			if get_node("/root/Hud").kill >= 90:
				get_tree().change_scene("res://finale.tscn")
		if diff == 2:
			get_node("/root/Hud").maxkill = 100
			if get_node("/root/Hud").kill >= 100:
				get_tree().change_scene("res://finale.tscn")
		if diff == 3:
			get_node("/root/Hud").maxkill = 110
			if get_node("/root/Hud").kill >= 110:
				get_tree().change_scene("res://finale.tscn")
				
	if get_tree().current_scene.name == "stage4b":
		if diff == 1:
			get_node("/root/Hud").maxkill = 90
			if get_node("/root/Hud").kill >= 90:
				get_tree().change_scene("res://finaleb.tscn")
		if diff == 2:
			get_node("/root/Hud").maxkill = 100
			if get_node("/root/Hud").kill >= 100:
				get_tree().change_scene("res://finaleb.tscn")
		if diff == 3:
			get_node("/root/Hud").maxkill = 110
			if get_node("/root/Hud").kill >= 110:
				get_tree().change_scene("res://finaleb.tscn")
				
	if get_tree().current_scene.name == "finale":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
	if get_tree().current_scene.name == "finaleb":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
	
	if get_tree().current_scene.name == "boss4":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/MAX").show()
		get_node("/root/Hud/Display/KILL").show()
		get_node("/root/Hud/Display/speed").show()
		get_node("/root/Hud/Display/char").show()
		
	if get_tree().current_scene.name == "boss4b":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/LIVES").show()
		get_node("/root/Hud/Display/DIFF").show()
		get_node("/root/Hud/Display/MAX").show()
		get_node("/root/Hud/Display/KILL").show()
		get_node("/root/Hud/Display/speed").show()
		get_node("/root/Hud/Display/char").show()
		
	if get_tree().current_scene.name == "sbend":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
	if get_tree().current_scene.name == "bend":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
	if get_tree().current_scene.name == "credits":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
	if get_tree().current_scene.name == "message":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()
		
	if get_tree().current_scene.name == "badnedsb":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/LIVES").hide()
		get_node("/root/Hud/Display/DIFF").hide()
		get_node("/root/Hud/Display/KILL").hide()
		get_node("/root/Hud/Display/MAX").hide()
		get_node("/root/Hud/Display/border").hide()
		get_node("/root/Hud/Display/canon").hide()
		get_node("/root/Hud/Display/speed").hide()
		get_node("/root/Hud/Display/char").hide()

func _ready():
	var font = _label.get("custom_fonts/font")
	if charac == 1:
		font.outline_color = Color.red
	if charac == 2:
		font.outline_color = Color.blue
	
func set_score(value):
	score = value
	get_node("/root/Hud/Display/SCORE").set_text("Score: "+str(score).pad_zeros(6))
	
func set_health(value):
	health = value
	get_node("/root/Hud/Display/LIVES").set_text("Lives: "+str(health))
	if health <= -1:
		if contines == true:
			get_tree().paused = true
			get_node("/root/Continue/ColorRect").show()
			get_node("/root/Continue/Label").show()
			get_node("/root/Continue/VBoxContainer").show()
		else:
			get_tree().change_scene("res://gameover.tscn")
	
func set_kill(value):
	kill = value
	get_node("/root/Hud/Display/KILL").set_text("Killed: "+str(kill))
	
func set_maxx(value):
	maxkill = value
	get_node("/root/Hud/Display/MAX").set_text("Max Kills: "+str(maxkill))

func set_diff(value):
	diff = value
	if diff == 1:
		get_node("/root/Hud/Display/DIFF").set_text("Difficulty: Easy")
	if diff == 2:
		get_node("/root/Hud/Display/DIFF").set_text("Difficulty: Normal")
	if diff == 3:
		get_node("/root/Hud/Display/DIFF").set_text("Difficulty: Hard")

func _on_fogtimer_timeout():
	get_node("/root/Hud/Display/fogtimer").stop()
	get_node("/root/Hud/Display/fogtimer2").start()
	get_node("/root/Hud/Display/fog1").show()
	get_node("/root/Hud/Display/fog2").hide()

func _on_fogtimer2_timeout():
	get_node("/root/Hud/Display/fogtimer").start()
	get_node("/root/Hud/Display/fogtimer2").stop()
	get_node("/root/Hud/Display/fog1").hide()
	get_node("/root/Hud/Display/fog2").show()

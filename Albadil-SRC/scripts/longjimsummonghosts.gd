extends Node2D

const MIN_SPAWN_TIME = 1.5

var ghosts := preload("res://ghost.tscn")

onready var spawnTimer := $SpawnTimer
var nextSpawnTimer := 2.0

func _ready():
	randomize()
	spawnTimer.start(nextSpawnTimer)
	
func _physics_process(delta):
	if get_node("/root/Hud").diff == 1:
		nextSpawnTimer = 5.0
	if get_node("/root/Hud").diff == 2:
		nextSpawnTimer = 3.0
	if get_node("/root/Hud").diff == 3:
		nextSpawnTimer = 2.0

func _on_SpawnTimer_timeout():
	var viewRect = get_viewport_rect()
	var xPos := rand_range(viewRect.position.x, viewRect.end.x)
	
	var daghost := ghosts.instance()
	daghost.position = Vector2(xPos, position.y)
	get_tree().current_scene.add_child(daghost)
	
	nextSpawnTimer -= 0.1
	if nextSpawnTimer < MIN_SPAWN_TIME:
		nextSpawnTimer = MIN_SPAWN_TIME
	spawnTimer.start(nextSpawnTimer)

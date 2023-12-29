extends Node2D

const MIN_SPAWN_TIME = 1.5

var preloadedEnemies := [
	preload("res://suicbot.tscn"),
	preload("res://speeders.tscn"),
	preload("res://Polgiz.tscn")
]

var pertest := preload("res://lorbnew.tscn")

onready var spawnTimer := $SpawnTimer
var nextSpawnTimer := 0.9

func _ready():
	randomize()
	spawnTimer.start(nextSpawnTimer)

func _on_SpawnTimer_timeout():
	var viewRect = get_viewport_rect()
	var xPos := rand_range(viewRect.position.x, viewRect.end.x)
	
	if randf() < 0.3:
		var lorb := pertest.instance()
		lorb.position = Vector2(xPos, position.y)
		get_tree().current_scene.add_child(lorb)
	else:
		var enemyPreload = preloadedEnemies[randi() % preloadedEnemies.size()]
		var enemy: Enemy = enemyPreload.instance()
		enemy.position = Vector2(xPos, position.y)
		get_tree().current_scene.add_child(enemy)
	
	nextSpawnTimer -= 0.1
	if nextSpawnTimer < MIN_SPAWN_TIME:
		nextSpawnTimer = MIN_SPAWN_TIME
	spawnTimer.start(nextSpawnTimer)

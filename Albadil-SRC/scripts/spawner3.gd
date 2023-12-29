extends Node2D

const MIN_SPAWN_TIME = 1.5

var preloadedEnemies := [
	preload("res://digit1.tscn"),
	preload("res://digit2.tscn")
]

onready var spawnTimer := $spawnTimer
var nextSpawnTimer := 1.0

func _ready():
	randomize()
	spawnTimer.start(nextSpawnTimer)

func _on_spawnTimer_timeout():
	var viewRect = get_viewport_rect()
	var xPos := rand_range(viewRect.position.x, viewRect.end.x)
	
	var enemyPreload = preloadedEnemies[randi() % preloadedEnemies.size()]
	var enemy: Enemy = enemyPreload.instance()
	enemy.position = Vector2(xPos, position.y)
	get_tree().current_scene.add_child(enemy)
	
	nextSpawnTimer -= 0.1
	if nextSpawnTimer < MIN_SPAWN_TIME:
		nextSpawnTimer = MIN_SPAWN_TIME
	spawnTimer.start(nextSpawnTimer)

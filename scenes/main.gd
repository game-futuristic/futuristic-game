extends Node2D

@export var PlayerScene: PackedScene
@export var EnemyScene: PackedScene
@onready var line = $Line2D

var player
var enemy1
var enemy2
var enemy3
var enemiesArray = [enemy1, enemy2, enemy3]

# Called when the node enters the scene tree for the first time.
func _ready():
	player = PlayerScene.instantiate()
	add_child(player)
	var x_pos = 50
	var i = 1
	for e in enemiesArray:
		e = EnemyScene.instantiate()
		e.global_position = Vector2(x_pos*i, 100)
		i += 2
		add_child(e)
		e.add_to_group("enemies")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("eventHorizon"):
		line.add_point(player.get_global_position())
	if Input.is_action_just_released("eventHorizon"):
		var all_enemies = get_tree().get_nodes_in_group("enemies")
		for e in all_enemies:
			if Geometry2D.is_point_in_polygon(e.global_position, line.points):
				e.queue_free()
		line.points = []

func _physics_process(delta):
	var player_position = player.get_global_position()
#	enemy.shoot(player_position)

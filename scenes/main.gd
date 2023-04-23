extends Node2D

@export var PlayerScene: PackedScene
@export var EnemyScene: PackedScene
@onready var line = $Line2D
@onready var closeLine = $closeLine
@export var StartOfZone: PackedScene

var player
var startZone
var enemy1
var enemy2
var enemy3
var enemiesArray = [enemy1, enemy2, enemy3]
var initialPoint
var endPoint

var power = 0

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
	if Input.is_action_just_pressed("eventHorizon") and power == 0:
		power = 1
		player.activated = 1
		print("Poder activado")
	if power == 1:
		line.add_point(player.get_global_position())
	if (player.onZone == 3):
		print("Llego al punto inicial nuevamente: ", player.get_global_position())
		var all_enemies = get_tree().get_nodes_in_group("enemies")
		player.activated = 0
		for e in all_enemies:
			if Geometry2D.is_point_in_polygon(e.global_position, line.points):
				e.queue_free()
		startZone.queue_free()
		line.points = []
		power = 0
		player.onZone = 0
		print("Valor onZone nuevamente seteado a 0")

func _physics_process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("eventHorizon") and power == 0:
		startZone = StartOfZone.instantiate()
		initialPoint = player.get_global_position()
		startZone.global_position = initialPoint
		add_child(startZone)
		print("punto inicial: ", initialPoint)

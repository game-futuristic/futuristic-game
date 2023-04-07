extends Node2D

@export var PlayerScene: PackedScene
@export var EnemyScene: PackedScene

var player 
var enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	player = PlayerScene.instantiate()
	add_child(player)
	enemy = EnemyScene.instantiate()
	add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var player_position = player.get_global_position()
	enemy.shoot(player_position)

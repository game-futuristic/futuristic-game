extends Node2D

@export var PlayerScene: PackedScene
@export var EnemyScene: PackedScene
@export var Enemy_2Scene: PackedScene
@export var GuardianEnemyScene: PackedScene

var player
var enemy_2
var enemy1
var enemy2
var enemy3
var guardian_enemy
var enemiesArray = [enemy1, enemy2, enemy3]

# Called when the node enters the scene tree for the first time.
func _ready():
	player = PlayerScene.instantiate()
	add_child(player)
	enemy_2 = Enemy_2Scene.instantiate()
	add_child(enemy_2)
	var x_pos = 50
	var i = 1
	guardian_enemy = GuardianEnemyScene.instantiate()
	guardian_enemy.global_position = Vector2(50, 50)
	add_child(guardian_enemy)
	guardian_enemy.add_to_group("enemies")
	for e in enemiesArray:
		e = EnemyScene.instantiate()
		e.global_position = Vector2(x_pos*i, 100)
		i += 2
		add_child(e)
		e.add_to_group("enemies")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	enemy_2.update_target_position(player.global_position)
	enemy_2._physics_process(delta)

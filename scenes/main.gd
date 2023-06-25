extends Node2D

@export var EnemyScene: PackedScene
@export var Enemy_2Scene: PackedScene
@export var GuardianEnemyScene: PackedScene
@onready var player = $Player
@onready var timer = $Timer

var enemy_2
var time = 0
var randomx 
var randomy 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	#enemy_2 = Enemy_2Scene.instantiate()
	#add_child(enemy_2)
	#var x_pos = 50
	#create_enemy(70, 70, GuardianEnemyScene)
	#for i in range(1, 5, 2):
	#	create_enemy(x_pos * i, 100, EnemyScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	#enemy_2.update_target_position(player.global_position)
	#enemy_2._physics_process(delta)
	get_groups()
	

func create_enemy(x, y, packed_scene):
	Variables.enemigos = Variables.enemigos +1 
	var enemy = packed_scene.instantiate()
	if x!=randomx and y!=randomy:
		enemy.global_position = Vector2(x, y)
	if x==randomx and y!=randomy:
		randomx = randi_range(-177, 650)
		enemy.global_position = Vector2(randomx, y)
	if  x==randomx and y==randomy:
		randomx = randi_range(-177, 650)
		randomy = randi_range(40, 270)
		enemy.global_position = Vector2(randomx, randomy)
	add_child(enemy)

func _on_timer_timeout():
	if time == 0:
		create_enemy(50, 70, EnemyScene,)
	if time == 10:
		create_enemy(60, 70, EnemyScene)
		create_enemy(300, 70, Enemy_2Scene)
	if time == 30:
		create_enemy(70, 70, EnemyScene)
		create_enemy(300, 70, Enemy_2Scene)
		create_enemy(50, 90, EnemyScene)
	if time == 50:
		create_enemy(50, 60, EnemyScene)
		create_enemy(300, 90, Enemy_2Scene)
		create_enemy(100, 120, EnemyScene)
		create_enemy(200, 150, GuardianEnemyScene)
	if time == 80:
		create_enemy(randomx, 60, EnemyScene)
		create_enemy(randomx, 70, Enemy_2Scene)
		create_enemy(randomx, 90, EnemyScene)
		create_enemy(randomx, 80, GuardianEnemyScene)
	if time == 110:
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, Enemy_2Scene)
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, GuardianEnemyScene)
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, EnemyScene)
	if time == 160:
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, Enemy_2Scene)
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, GuardianEnemyScene)
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, Enemy_2Scene)
		create_enemy(randomx, randomy, EnemyScene)
		create_enemy(randomx, randomy, GuardianEnemyScene)
	if time >= 160 and Variables.enemigos ==0:
		Variables.time = time
		Variables.cont = Variables.cont + 10
		get_tree().change_scene_to_file("res://scenes/menufinal.tscn")
	if time == 220:
		Variables.time = 220
		get_tree().change_scene_to_file("res://scenes/menufinal.tscn")
		
	time = time +1
	Variables.time = time
	

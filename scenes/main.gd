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
	var enemy = packed_scene.instantiate()
	if x!=randomx and y!=randomy:
		enemy.global_position = Vector2(x, y)
		add_child(enemy)
	if x==randomx and y!=randomy:
		randomx = randi_range(40, 350)
		enemy.global_position = Vector2(randomx, y)
		add_child(enemy)
	if  x==randomx and y==randomy:
		randomx = randi_range(40, 350)
		randomy = randi_range(40, 100)
		enemy.global_position = Vector2(randomx, randomy)
		add_child(enemy)


func _on_timer_timeout():
	print(time)
	if time == 0:
		create_enemy(50, 70, EnemyScene,)
	if time == 10:
		create_enemy(50, 70, EnemyScene)
		create_enemy(300, 70, Enemy_2Scene)
	if time == 30:
		create_enemy(50, 70, EnemyScene)
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
	time = time +1
	

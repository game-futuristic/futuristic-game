extends Node2D

@export var PlayerScene: PackedScene
@export var EnemyScene: PackedScene
@export var Enemy_2Scene: PackedScene
@export var GuardianEnemyScene: PackedScene

var player
var enemy_2

# Called when the node enters the scene tree for the first time.
func _ready():
	player = PlayerScene.instantiate()
	add_child(player)
	enemy_2 = Enemy_2Scene.instantiate()
	add_child(enemy_2)
	var x_pos = 50
	create_enemy(50, 50, GuardianEnemyScene)
	for i in range(1, 6, 2):
		create_enemy(x_pos * i, 100, EnemyScene)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	enemy_2.update_target_position(player.global_position)
	enemy_2._physics_process(delta)

# Por ahora crearemos los guardianes dandole una coordenada de spawneo
func create_enemy(x, y, packed_scene):
	var enemy = packed_scene.instantiate()
	enemy.global_position = Vector2(x, y)
	add_child(enemy)
	enemy.add_to_group("enemies") # Esto despues no seria necesario pues se obtienen enemigos sabiendo que tienen el metodo takedamage

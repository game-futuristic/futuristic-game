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
	#get_groups()
	pass
	

func create_enemy(x: float, y: float, packed_scene: PackedScene):
	
	
	Variables.enemigos = Variables.enemigos +1
	var enemy = packed_scene.instantiate()
	if is_inf(x):
		x = randi_range(-180, 640)
	if is_inf(y):
		y = randi_range(50, 280)
	enemy.global_position = Vector2(x, y)
	add_child(enemy)

func _on_timer_timeout():
	if time >= 160 and Variables.enemigos ==0:
		Variables.time = time
		get_tree().change_scene_to_file("res://scenes/menufinal.tscn")
	if time == 250:
		Variables.cont = Variables.cont + 10#10 puntos por terminar el juego
		Variables.time = 250
		get_tree().change_scene_to_file("res://scenes/menufinal.tscn")
	print(time)
	time = time +1
	
#func pause(delta):
#	visible = !visible
#	get_tree().paused = visible
#func _fin_(delta):
#	get_tree().change_scene_to_file("res://scenes/menufinal.tscn")

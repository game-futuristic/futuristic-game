#extends Node2D

#@export var EnemyScene: PackedScene
#@export var Enemy_2Scene: PackedScene
#@export var GuardianEnemyScene: PackedScene

#var enemy_2

#func _ready():
#	enemy_2 = Enemy_2Scene.instantiate()
#	add_child(enemy_2)
#	var x_pos = 50
#	create_enemy(70, 70, GuardianEnemyScene)
#	for i in range(1, 5, 2):
#		create_enemy(x_pos * i, 100, EnemyScene)
		
#func create_enemy(x, y, packed_scene):
#	var enemy = packed_scene.instantiate()
#	enemy.global_position = Vector2(x, y)
#	add_child(enemy)
	
#func _on_timer_timeout():
#	create_enemy(0, 0, EnemyScene)

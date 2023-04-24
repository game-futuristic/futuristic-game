extends CharacterBody2D

@onready var navigation_agent_2d = $NavigationAgent2D


var SPEED = 100

func _physics_process(delta):
	print("inicio physics")
	var current_position = global_transform.origin
	print(current_position)
	var next_position = navigation_agent_2d.get_next_path_position()
	print(next_position)
	#var new_velocity = (next_position - current_position).normalized() * SPEED 
	#print(new_velocity)
	velocity = Vector2.ZERO # hay que usar new_velocity pero no sé cual es el error
	print (velocity)
	move_and_slide()
	
func _update_target_position(target_position):
	print("target position")
	navigation_agent_2d.set_target_position(target_position)

#@export var Bullet: PackedScene

#@onready var origin_of_bullets = $OriginOfBullets

#func _physics_process(delta):
#	pass

# get_global_position() puede servir para obtener la posicion
# del jugador y dirigir las balas hacia el
#func shoot(player_position):
#	#pass
#	var bullet_instance = Bullet.instantiate()
#	add_child(bullet_instance)
#	bullet_instance.global_position = origin_of_bullets.global_position
#	var bullet_direction = bullet_instance.global_position.direction_to(player_position).normalized()
#	bullet_instance.set_direction(bullet_direction)

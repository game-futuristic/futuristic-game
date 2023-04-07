extends CharacterBody2D

@export
var Bullet: PackedScene

@onready
var origin_of_bullets = $OriginOfBullets

func _physics_process(delta):
	pass

# get_global_position() puede servir para obtener la posicion
# del jugador y dirigir las balas hacia el
func shoot(player_position):
	var bullet_instance = Bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.global_position = origin_of_bullets.global_position
	var bullet_direction = bullet_instance.global_position.direction_to(player_position).normalized()
	bullet_instance.set_direction(bullet_direction)
	#remove_child(bullet_instance)

extends CharacterBody2D

var SPEED = 150.0
var motion = Vector2.ZERO

var path: Array = []
var NavigationNode = null
var player  = null

func _ready():
	if get_tree().has_group("nav"):
		NavigationNode = get_tree().get_nodes_in_group("nav")[0]
	if get_tree().has_group("enemy"):
		player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta):
	create_path()
	
	if player:
		if path.size() > 0:
			motion = global_position.direction_to(path[1]) *SPEED
		#motion = position.direction_to(player.global_position) * SPEED

	
func create_path():
	if NavigationNode != null and player !=null:
		path = NavigationNode.get_simple_path(global_position, player.global_position, false)
		

#func goto():
#	if path.size() > 0:
#		motion = global_position.direction_to(path[1]) *SPEED
		
		
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

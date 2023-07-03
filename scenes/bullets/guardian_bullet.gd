extends Area2D

var player = Player

var velocity = Vector2(10,0)
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	
func _process(delta):
	pass

func _physics_process(delta):
	var a = player.global_position[1]- global_transform.origin[1]
	velocity = Vector2 (10,a) 
	print(velocity)
	translate(velocity)

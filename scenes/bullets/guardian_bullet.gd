extends CharacterBody2D
class_name Bullet

var player = Player
var SPEED = 40
var targeting = true

func _ready():
	
	player = get_tree().get_first_node_in_group("Player")
	velocity = (player.global_position -  global_position).normalized() * SPEED
	var tween = create_tween()
	tween.tween_callback(set.bind("targeting", false)).set_delay(1)
	tween.tween_callback(queue_free).set_delay(5)
	
func _process(delta):
	pass

func _physics_process(delta):
	if targeting:
		var new_velocity = (player.global_position -  global_position).normalized() * SPEED
		velocity = velocity.move_toward(new_velocity, 0.5)
	move_and_slide()


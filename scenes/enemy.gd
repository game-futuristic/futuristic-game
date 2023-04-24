extends CharacterBody2D

const SPEED = 30

var player = null
var player_chase = false

func _physics_process(delta):
	if player_chase:
		position += (player.global_position - position)/SPEED

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

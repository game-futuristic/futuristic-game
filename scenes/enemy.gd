extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var animation_player = $AnimationPlayer

const SPEED = 300

var player = null
var player_chase = false

func _physics_process(delta):
	if player_chase:
		position += (player.global_position - position)/SPEED
		
		#animation_player.play("run")
	#else:
		#animation_player.play("idle")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
		
		
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

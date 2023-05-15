extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var animation_player = $AnimationPlayer

const SPEED = 300
const SPEED = 45

var health = 100
var player_inattack_zone = false

var player = null
var player_chase = false

func _physics_process(delta):
	
	deal_with_damage()
	
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

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func deal_with_damage():
	if health <= 0:
		self.queue_free()

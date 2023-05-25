extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var animation_player = $AnimationPlayer
@onready var progress_bar = $ProgressBar

const SPEED = 45
const MAX_HEALTH = 100

var health = MAX_HEALTH:
	set(value):
		health = value
		set_health(value)
		progress_bar.visible = true # Solo visible cuando el jugador danha al enemigo
	get:
		return health


var player_inattack_zone = false

var player = null
var player_chase = false

var cooldown_shooting = true

func _physics_process(delta):
	

	if player_chase:
		position += (player.global_position - position)/SPEED
		animation_player.play("run")
	else:
		animation_player.play("idle")
	deal_with_damage()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
		
		
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass

func set_health(value):
	progress_bar.value = value

func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func take_damage(damage):
	health = max(health - damage, 0)

func deal_with_damage():
	if health == 0:
#		animation_player.play("death")
		get_parent().remove_child(self)

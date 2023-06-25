extends Enemy

@onready var progress_bar = $ProgressBar
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var playerr: PackedScene


const SPEED = 60
const MAX_HEALTH = 100

var health = MAX_HEALTH:
	set(value):
		health = value
		progress_bar.value = value
		progress_bar.visible = true # Solo visible cuando el jugador danha al enemigo
		deal_with_damage()
	get:
		return health

func take_damage(damage):
	health = maxi(health - damage, 0)

func deal_with_damage():
	if health == 0:
#		animation_player.play("death")
		Variables.cont = Variables.cont + 1
		get_parent().remove_child(self) 


var player_inattack_zone = false

var player = null
var player_chase = false

var cooldown_shooting = true

func _physics_process(delta):
	if player_chase:
		position += (player.global_position - position)/SPEED
		animated_sprite_2d.play("run")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	
		
		
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	animated_sprite_2d.play("idle")
	
func enemy():
	pass

func _on_enemy_hitbox_body_entered(body):
	if body is Player:
		player_inattack_zone = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
#----------------------------------------------------------------------------------------------

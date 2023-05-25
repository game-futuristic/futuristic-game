extends CharacterBody2D

@onready var progress_bar = $ProgressBar

const SPEED = 45
const MAX_HEALTH = 100

func _physics_process(delta):
	deal_with_damage()

var health = MAX_HEALTH:
	set(value):
		health = value
		set_health(value)
		progress_bar.visible = true # Solo visible cuando el jugador danha al enemigo
	get:
		return health

func set_health(value):
	progress_bar.value = value

func take_damage(damage):
	health = max(health - damage, 0)

func deal_with_damage():
	if health == 0:
#		animation_player.play("death")
		get_parent().remove_child(self)

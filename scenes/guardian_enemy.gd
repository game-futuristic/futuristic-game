extends Enemy

@export var BulletScene : PackedScene

@onready var progress_bar = $ProgressBar
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer


var target = null
var target_in_zone = false
var bullet

const SPEED = 20
const MAX_HEALTH = 100

enum {
	PATROL,
	ENGAGE
}
var state = ENGAGE

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
#		animated_sprite_2d.play("death")
		get_parent().remove_child(self)
		Variables.cont = Variables.cont + 2
		Variables.enemigos = Variables.enemigos - 1
#------------------------------------------------------------------------------------------------------
func shot():
	if target:
		bullet = BulletScene.instantiate()
#		bullet.global_position = self.get_global_position()
		add_child(bullet)
		bullet.global_position = global_position
		bullet.rotation = global_rotation
		
		
		#bullet.global_position = direction
		#bullet.position += (target.global_position - global_position)/SPEED
		#bullet.global_rotation = direction

func _on_shooting_zone_body_entered(body):
	if body.has_method("player"):
		target = body
		target_in_zone = true
		timer.start()

func _on_shooting_zone_body_exited(body):
	if body.has_method("player"):
		target = null
		target_in_zone = false
		timer.stop()

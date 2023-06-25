extends Enemy

@onready var nav_agent = $NavigationAgent2D
@onready var animation_player = $AnimationPlayer
@onready var pivote = $Pivote
@onready var progress_bar = $ProgressBar

const SPEED = 10
const MAX_HEALTH = 100

var health = MAX_HEALTH:
	set(value):
		health = value
		progress_bar.value = value
		progress_bar.visible = true # Solo visible cuando el jugador danha al enemigo
		deal_with_damage()
	get:
		return health

func _physics_process(delta):
	#pathfinding
	var current_position = global_transform.origin
	var next_position = nav_agent.get_next_path_position()
	var new_velocity = (next_position - current_position).normalized() * SPEED
	var move_input
	
	velocity = new_velocity
	move_and_slide()
	
	#direction
	if velocity != Vector2.ZERO:
		animation_player.play("run")
	else:
		animation_player.play("idle")
	if velocity[0]>0:
		move_input = 1
	else:
		move_input = -1
	if move_input:
		pivote.scale.x = sign(move_input)	
		
func update_target_position(target_position):
	nav_agent.set_target_position(target_position)

func take_damage(damage):
	health = maxi(health - damage, 0)

func deal_with_damage():
	if health == 0:
		animation_player.play("death")
		get_parent().remove_child(self)


	

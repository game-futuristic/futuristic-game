class_name Player
extends CharacterBody2D

const SPEED = 95.0
const MAX_HEALTH = 100
const EVENT_HORIZON_DAMAGE = 30
const THRESHOLD = 1225

@export var startEventHorizonScene : PackedScene
@onready var eventHorizonTrail : Line2D = $eventHorizonTrail
@onready var hud = $CanvasLayer/HUD
@onready var animated_sprite_2d = $AnimatedSprite2D

var health = 100:
	set(value):
		health = value
		hud.set_health(health)
		deal_with_damage()
	get:
		return health

var enemy_inattack_range = false # Detecta si enemigo esta en la zona de ataque
var enemy_attack_cooldown = true
var player_alive = true

@onready var startEventHorizon = startEventHorizonScene.instantiate()

var is_event_horizon_activated = false


func _ready():
	eventHorizonTrail.set_as_top_level(true)

func _physics_process(delta):
	move_and_slide()
	update_health()
	player_movement()
	eventHorizon()
	enemy_attack()
	if Input.is_action_just_pressed("left"):
		animated_sprite_2d.flip_h = true
	if Input.is_action_just_pressed("right"):
		animated_sprite_2d.flip_h = false
	if !Input.is_action_just_pressed("right") and Input.is_action_just_pressed("down") and Input.is_action_just_pressed("left") and Input.is_action_just_pressed("up"):
		animated_sprite_2d.play("idle")

func _process(delta):
	update_health()

func _input(event):
	if Input.is_action_just_pressed("eventHorizon") and !is_event_horizon_activated:
		is_event_horizon_activated = true
		startEventHorizon.global_position = global_position
		
		# Volvemos a setear a valores por defecto false, pues al remover el nodo
		# los valores son los seteados la ultima vez (i.e true)
		startEventHorizon.is_entering_again = false
		
		get_parent().add_child(startEventHorizon)

# ------------------------------------------------------------------------------
# Movimiento jugador

func player_movement():
	var x_direction = Input.get_axis("left", "right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var y_direction = Input.get_axis("up", "down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

# ------------------------------------------------------------------------------
# Event Horizon

func eventHorizon():
	if is_event_horizon_activated:
		if eventHorizonTrail.get_point_count() == 0 or \
				global_position.distance_squared_to(eventHorizonTrail.points[-1]) > THRESHOLD:
			eventHorizonTrail.add_point(global_position)

func close_event_horizon():
	var all_enemies = get_tree().get_nodes_in_group("enemy")
	for e in all_enemies:
		if Geometry2D.is_point_in_polygon(e.global_position, eventHorizonTrail.points):
#				e.health = e.health - 50
			e.take_damage(EVENT_HORIZON_DAMAGE)
	# Volvemos a setear event_horizon a su valor por defecto false
	is_event_horizon_activated = false
	eventHorizonTrail.clear_points()

# ------------------------------------------------------------------------------
# Control logica ataques enemigos

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
#		health_bar.value -= 50
		take_damage(10)
		enemy_attack_cooldown = false
		$attackCooldown.start()
		print("enemy attack!")
#		print("healthbar.value", health_bar.value)

func take_damage(damage):
	health = max(health - damage, 0)
	
func deal_with_damage():
	if health == 0:
#		animated_sprite_2d.play("death")
		get_tree().change_scene_to_file("res://scenes/menufinal.tscn")

# Este metodo es similar al metodo enemy de la clase de enemigos, es para identificar
# que el objeto sea de un tipo en especifico usando has_method(), como en el caso de la
# senhal _on_player_hitbox_body_exited(body)
func player():
	pass


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

# ------------------------------------------------------------------------------
# Barra de salud y regeneracion

# La barra de salud es de 500 y hasta ahora los enemigos pegan 50 (en enemy_attack() se muestra)
# tambien hay regeneracion de la barra de salud cada 5 segundos si es que esta disminuyo,
# la regeneracion es de 40
# Cualquier edit a la barra de salud se debe hacer desde el nodo en el inspector.

func update_health():
	pass
#	if health_bar.value >= 500:
#		health_bar.visible = false
#	else:
#		health_bar.visible = true

func _on_regin_timer_timeout():
	pass
#	if health_bar.value < 500:
#		health_bar.value += 40
#		if health_bar.value > 500:
#			health_bar.value = 500
#	if health_bar.value <= 0:
#		health_bar.value = 0

# ------------------------------------------------------------------------------

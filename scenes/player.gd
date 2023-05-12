extends CharacterBody2D

const SPEED = 125.0

@export var startEventHorizonScene : PackedScene

@onready var eventHorizonTrail = $eventHorizonTrail

var enemy_inattack_range = false # Detecta si enemigo esta en la zona de ataque
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var onZone = 0
var activated = 0
var power = 0
var startEventHorizon

func _ready():
	eventHorizonTrail.set_as_top_level(true)

func _physics_process(delta):
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
	move_and_slide()

func eventHorizon():
	if Input.is_action_just_pressed("eventHorizon") and power == 0:
		power = 1
		activated = 1
		print("Poder activado")
	if power == 1:
		eventHorizonTrail.add_point(self.get_global_position())
	if (self.onZone == 3):
		print("Llego al punto inicial nuevamente: ", self.get_global_position())
		var all_enemies = get_tree().get_nodes_in_group("enemies")
		self.activated = 0
		for e in all_enemies:
			if Geometry2D.is_point_in_polygon(e.global_position, eventHorizonTrail.points):
#				e.queue_free()
				e.health = e.health - 50
		startEventHorizon.queue_free()
		eventHorizonTrail.points = []
		power = 0
		self.onZone = 0
		print("Valor onZone nuevamente seteado a 0")

func startZone(v):
	onZone += v

func _input(event):
	if Input.is_action_just_pressed("eventHorizon") and power == 0:
		startEventHorizon = startEventHorizonScene.instantiate()
		var initialPoint = self.get_global_position()
		startEventHorizon.global_position = initialPoint
		get_parent().add_child(startEventHorizon)
		print("punto inicial: ", initialPoint)


func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attackCooldown.start()
		print("enemy attack!")

# Este metodo es similar al metodo enemy de la clase de enemigos, es para identificar
# que el objeto sea de un tipo en especifico usando has_method(), como en el caso de la
# senhal _on_player_hitbox_body_exited(body)
func player():
	pass


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

extends CharacterBody2D

@onready var nav_agent = $NavigationAgent2D
const SPEED = 10

func _ready():
	pass
	
func _process(delta):
	pass

func _physics_process(delta):
	var current_position = global_transform.origin
	var next_position = nav_agent.get_next_path_position()
	var new_velocity = (next_position - current_position).normalized() * SPEED
	
	velocity = new_velocity
	move_and_slide()

func update_target_position(target_position):
	nav_agent.set_target_position(target_position)

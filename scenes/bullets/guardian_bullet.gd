extends Area2D

@onready var player = $Player

var velocity = Vector2(10,0)
func _ready():
	pass
	
func _process(delta):
	pass

func _physics_process(delta):
	#velocity = player.global_position
	translate(velocity)

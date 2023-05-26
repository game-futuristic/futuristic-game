extends CharacterBody2D

@onready var animation_player = $AnimationPlayer


func _physics_process(delta):
	animation_player.play("move")

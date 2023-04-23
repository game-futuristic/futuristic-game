extends Area2D

@export var player: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.startZone(1)
		print("DENTRO")

func _on_body_exited(body):
	if body.is_in_group("Player") and body.activated == 1:
		body.startZone(1)
		print("FUERA")

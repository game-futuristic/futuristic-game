extends Area2D

@export var player: PackedScene

var is_entering_again = false
var area_closed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("player") and is_entering_again:
		area_closed = true

func _on_body_exited(body):
	if body.has_method("player"):
		is_entering_again = true


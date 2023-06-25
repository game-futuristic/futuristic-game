extends Area2D

@export var player: PackedScene

var is_entering_again = false

func _on_body_entered(body):
	if body is Player and is_entering_again:
		body.close_event_horizon()
		get_parent().remove_child(self) #aqui hay un problema pero no sé que lo causa

func _on_body_exited(body):
	if body is Player:
		is_entering_again = true

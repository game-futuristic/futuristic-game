extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("dibujar"):
		dibujar()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func dibujar():
		add_point(get_parent().get_global_position())
		#var b =PackedVector2Array()
		#print (b)	
		#print (PackedVector2Array)
	#if points.size()>15:
	#	remove_point(0)

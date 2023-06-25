extends MarginContainer

@onready var progress_bar = $PanelContainer/MarginContainer/VBoxContainer/ProgressBar

func set_health(value):
	progress_bar.value = value
	
@onready var enemigos = $PanelContainer/MarginContainer/VBoxContainer/enemigos

func _process(delta):
	enemigos.text = "Enemigos: "+str(Variables.enemigos)

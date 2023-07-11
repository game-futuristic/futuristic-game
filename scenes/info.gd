extends MarginContainer

@onready var volver = $PanelContainer/MarginContainer/VBoxContainer/volver


func _ready():
	volver.pressed.connect(_on_volver_pressed)

func _on_volver_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

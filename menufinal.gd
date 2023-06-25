extends MarginContainer

@onready var volver = %volver
@onready var menu = %menu

@export var main_scene: PackedScene

func _ready():
	volver.pressed.connect(_on_volver_pressed)
	menu.pressed.connect(_on_menu_pressed)

func _on_volver_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	#get_tree().change_scene_to_packed(main_scene)
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

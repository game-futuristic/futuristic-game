extends MarginContainer

@onready var play = %Inicio
@onready var exit = %Salir
@onready var creditos = %Creditos
@onready var info = %info



@export var main_scene: PackedScene

func _ready():
	play.pressed.connect(_on_play_pressed)
	exit.pressed.connect(_on_exit_pressed)
	creditos.pressed.connect(_on_creditos_pressed)
	info.pressed.connect(_on_info_pressed)
	

func _on_play_pressed():
	Variables.cont = 0 
	Variables.time = 0 
	Variables.enemigos = 0
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	#get_tree().change_scene_to_packed(main_scene)
func _on_exit_pressed():
	get_tree().quit()
	
func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")

func _on_info_pressed():
	get_tree().change_scene_to_file("res://scenes/info.tscn")
	

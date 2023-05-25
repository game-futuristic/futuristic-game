extends MarginContainer
@onready var progress_bar = $ProgressBar

func set_health(value):
	progress_bar.value = value

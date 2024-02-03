extends NinePatchRect

const GREEN_TEXTURE = preload("res://assets/green_panel.png")

@onready var level_label = $LevelLabel
@onready var check_mark = $CheckMark

var _level_num: String = "99"

# Called when the node enters the scene tree for the first time.
func _ready():
	level_label.text = _level_num
	if ScoreSync.has_level_score(_level_num):
		check_mark.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_level_num(level_number: String) -> void:
	_level_num = level_number

func _on_gui_input(event):
	if event.is_action_pressed("select"):
		texture = GREEN_TEXTURE
		SignalManager.on_level_selected.emit(_level_num)

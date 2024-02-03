extends CanvasLayer

const button_scene: PackedScene = preload("res://level_button/level_button.tscn")
const LEVEL_COLS: int = 6
const LEVEL_ROWS: int = 5

@onready var gc_levels = $MC/VBoxContainer/GCLevels


# Called when the node enters the scene tree for the first time.
func _ready():
	setup_grid()

func setup_grid() -> void:
	for level in range(LEVEL_COLS*LEVEL_ROWS):
		var lbs = button_scene.instantiate()
		lbs.set_level_num(str(level+1))
		gc_levels.add_child(lbs)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	ScoreSync.save_scores()
	get_tree().quit()

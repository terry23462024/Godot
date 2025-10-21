extends Node2D
var score = 0
@onready var score_label = $"CanvasLayer/ScoreLabe,"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_score(enemy_score):
	score += enemy_score
	score_label.text = str("得分:",enemy_score,", 總分為 :",score)
	
func win():
	$CanvasLayer/GameOverLabel.text = str("you win")

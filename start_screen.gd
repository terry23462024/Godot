extends Control
@onready var promptlabel = $PromptLable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if promptlabel:
		blink_prompt()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func blink_prompt():
	#while true :
		#promptlabel.modulate.a = 1.0
		#await get_tree().create_timer(0.5).timeout
		#promptlabel.modulate.a = 0.3
		#await get_tree().create_timer(0.5).timeout
	var tween = create_tween().set_loops()
	tween.tween_property($PromptLable,"modulate:a",0.3,0.5)
	tween.tween_property($PromptLable,"modulate:a",1,0.5)
	
	
		


func _on_start_button_pressed() -> void:
	scale_button()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
	
func scale_button():
	var tween = create_tween()
	tween.tween_property($StartButton,"scale",Vector2(1.2,1.2),0.5)
	tween.tween_property($StartButton,"scale",Vector2(1,1),0.5)

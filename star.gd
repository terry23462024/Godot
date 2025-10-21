extends Node2D
var start_count = 50


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generater_star()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generater_star():
	for i in range(start_count):
		var star = ColorRect.new()
		var size = randi() % 2 +1
		star.size = Vector2(size,size)
		star.position.x = randi_range( 0 , 800)
		star.position.y = randi_range( 0 , 600)
		add_child(star)

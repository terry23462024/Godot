extends Area2D
@export var bullet_speed : int = 500



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= bullet_speed * delta
	if position.y <=  -15 :
		queue_free()
	



func _on_body_entered(body: Node2D) -> void:
	queue_free()




func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.hit()
	queue_free()

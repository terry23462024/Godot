extends Area2D
var enemy_speed = 100
var enemy_direction = 1
var enemy_score = 10



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#position.x = enemy_direction * enemy_speed * delta
	pass

func enemy_move_down():
	position.y += 50 

func enemy_change_direction():
	enemy_direction *= -1

func hit():
	$AudioStreamPlayer.play()
	$CollisionShape2D.set_deferred("disabled",true)
	remove_from_group("enemies")
	if get_parent().get_parent().has_method("add_score"):
		get_parent().get_parent().add_score(enemy_score)
	#$ColorRect.visible = false
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self,"scale",Vector2(1.5,1.5),0.3)
	tween.tween_property(self,"modulate:a",0.2,1)
	tween.set_parallel(false)
	tween.tween_callback(queue_free)
	

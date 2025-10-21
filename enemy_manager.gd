extends Node2D
@export var enemy_scene : PackedScene
var rows = 3
var columns = 5
var space_x = 60
var space_y = 60
var top_margin = 50
var offset
var screen_width
var start_position :Vector2
var all_enemies = []
var enemies_direction = 1
var enemies_speed = 100
var left_x
var right_x


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_width = get_viewport_rect().size.x
	offset = (screen_width - (columns - 1) * space_x)/2
	start_position.x = offset
	start_position.y = top_margin
	spawn_enemies()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position.x += enemies_direction * enemies_speed * delta
	check_edge()
	all_enemies = all_enemies.filter(func(e) : return is_instance_valid(e))
	
	if all_enemies.size() == 0 :
		if get_parent().has_method("win"):
			get_parent().win()
		print("you win")
		
	
	
	
func spawn_enemies():
	for row in range(rows) :
		for col in range(columns) :
			var enemy = enemy_scene.instantiate()
			enemy.position = Vector2(
				start_position.x + col * space_x,
				start_position.y + row * space_y
			)
			add_child(enemy)
			all_enemies.append(enemy)

func check_edge():
	left_x = 0
	right_x = screen_width
	for enemy in all_enemies :
		if is_instance_valid(enemy):
			left_x = max(right_x , enemy.global_position.x)
			right_x = min(right_x , enemy.global_position.x)
			
	if left_x > 770 and enemies_direction == 1 :
		enemies_direction *= -1
		position.y += 50
	elif right_x <= 30 and enemies_direction == -1:
		enemies_direction *= -1
		position.y += 50
			
			
	

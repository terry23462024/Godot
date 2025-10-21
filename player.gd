extends CharacterBody2D
@export var speed :int = 400
@export var bullet_scene : PackedScene
var can_shoot = true
var cool_down = 0.3
var screen_width
var screen_height
var player_width
var player_height
var player_start_position
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_width = get_viewport_rect().size.x
	screen_height = get_viewport_rect().size.y
	player_width = $CollisionShape2D.shape.size.x
	player_height = $CollisionShape2D.shape.size.y
	player_start_position = Vector2(screen_width / 2 , screen_height - 100)
	position = player_start_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * speed
	move_and_slide()
	position = position.clamp(Vector2(player_width/2,player_height/2),Vector2(screen_width-player_width/2,screen_height-player_height/2))
	
	if Input.is_action_just_pressed("fire") and can_shoot :
		shoot()

func shoot():
	if bullet_scene :
		can_shoot = false
		var bullet = bullet_scene.instantiate()
		bullet.position = position + Vector2( 0 , - 50)
		get_parent().add_child(bullet)
		$AudioStreamPlayer.play()
		
		await get_tree().create_timer(cool_down).timeout
		can_shoot = true
		
		

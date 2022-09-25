extends Area2D

export var speed = 400
var screen_size
var camera
var animationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	Input.set_use_accumulated_input(false)

	camera = $Camera2D
	animationPlayer = $AnimationPlayer
	animationPlayer.play("idle")
	

func _input(event):
	pass

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	#camera.position = position

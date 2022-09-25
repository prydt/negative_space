extends Area2D

export var speed = 400
var screen_size
var camera
var animationPlayer
var animatedSprite

var audioStreamPlayer

var weapon
var lantern

var health = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	Input.set_use_accumulated_input(false)

	camera = $Camera2D
	animationPlayer = $AnimationPlayer
	animationPlayer.play("idle")
	animatedSprite = $AnimationPlayer/AnimatedSprite
	
	audioStreamPlayer = $AudioStreamPlayer2D
	
	weapon = $AnimationPlayer/Weapon
	lantern = $AnimationPlayer/Light2D

func _input(event):
	pass

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	var isMoving = false
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		isMoving = true
		animatedSprite.animation = "up walking"
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		isMoving = true
		animatedSprite.animation = "walking frames"
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		isMoving = true
		animatedSprite.animation = "left walking"
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		isMoving = true
		animatedSprite.animation = "right walking"
	if isMoving == false:
		animatedSprite.animation = "idle frames"
		
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	animatedSprite.position += velocity * delta
	position += velocity * delta
	weapon.position = position
	lantern.position = position

	# play music
	if !audioStreamPlayer.is_playing():
		audioStreamPlayer.play()

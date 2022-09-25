extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animationPlayer
var animatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer = $AnimationPlayer
	animationPlayer.play("idle1")
	animatedSprite = $AnimationPlayer/AnimatedSprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animatedSprite.position = position





func _on_GIANT_ENEMY_SPIDER_body_entered(body):
	print("hi")

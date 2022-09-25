extends KinematicBody2D

var character
var screen_size

var low_pass_filter
var audio_stream_player

var mouse_moving

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	get_tree().get_root().connect("size_changed", self, "handle_resize")
	mouse_moving = false


func handle_resize():
	screen_size = get_viewport_rect().size



func _input(event):
	
	#ow_pass_filter.cutoff_hz = clamp(lerp(low_pass_filter.cutoff_hz, 0, 1), 0, 20000)
	
	if event is InputEventMouse:
		rotation_degrees = rad2deg(atan2(event.position.y - screen_size.y / 2 , 
										 event.position.x - screen_size. x / 2)) - 90
										
		scale.y = (screen_size / 2).distance_to(event.position) / 200


		
		
	if event is InputEventMouseMotion:
		var m_speed = event.speed

func _process(delta):
	pass

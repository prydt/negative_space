extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
		#rotation_degrees = character.position.angle_to(event.positison)a
		#rotation_degrees = rad2deg(character.position.angle_to_point(event.position))
		rotation_degrees = rad2deg(atan2(event.position.y - screen_size.y / 2 , 
										 event.position.x - screen_size. x / 2)) + 90
		#print("character position: ", character.position)
		#print("mouse position: ", event.global_position)
		#rotation_degrees = 30
		#scale = (character.position - event.position).normalized() * 5
		#scale = scale.normalized() * character.position.distance_to(event.position) / 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var character
var camera
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	character = get_parent()
	camera = get_parent().get_node("Camera2D")
	screen_size = get_viewport_rect().size
	#position = Vector2.ZERO
	
	get_tree().get_root().connect("size_changed", self, "handle_resize")


func handle_resize():
	screen_size = get_viewport_rect().size



func _input(event):
	if event is InputEventMouse:
		#rotation_degrees = character.position.angle_to(event.position)
		#rotation_degrees = rad2deg(character.position.angle_to_point(event.position))
		rotation_degrees = rad2deg(atan2(event.position.y - screen_size.y / 2 , 
										 event.position.x - screen_size. x / 2)) - 90
		#print("character position: ", character.position)
		#print("mouse position: ", event.global_position)
		#rotation_degrees = 30
		#scale = (character.position - event.position).normalized() * 5
		#scale = scale.normalized() * character.position.distance_to(event.position) / 100
		scale.y = (screen_size / 2).distance_to(event.position) / 200
		


func _process(delta):
	#position = character.position
	pass

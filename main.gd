extends Node

@onready var tree = $"."
@onready var viewport = $SubViewportContainer/SubViewport
@onready var subviewport = $SubViewportContainer
@onready var screen_border = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport_scale(176, 176)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	viewport_scale(176, 176)
	print(delta)
	
# Resize the viewport to an integer scale
func viewport_scale(scene_w, scene_h):
	var window_w = get_viewport().size.x
	var window_h = get_viewport().size.y
	var scale = 1
	if window_w / window_h >= scene_w / scene_h:
		scale = floor(window_h / scene_h)
	else:
		scale = floor(window_w / scene_w)
	subviewport.set_size(Vector2i(scene_w * scale, scene_h * scale))
	subviewport.set_position(Vector2((window_w - subviewport.size.x) / 2, (window_h - subviewport.size.y) / 2))
	subviewport.stretch_shrink = scale
	




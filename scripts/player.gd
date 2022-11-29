extends Spatial



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().quit(0)
		
	var viewport_mouse := get_viewport().get_mouse_position()
	var mouse_pos := get_viewport().get_camera().project_ray_origin(viewport_mouse)
	var mouse_ray := get_viewport().get_camera().project_ray_normal(viewport_mouse)
	
	var target_y   := 0.0
	var ray_y_step := (target_y - mouse_pos.y) / mouse_ray.y
	var cursor_pos := mouse_pos + mouse_ray * ray_y_step
	cursor_pos.x = stepify(cursor_pos.x - 0.5, 1)
	cursor_pos.z = stepify(cursor_pos.z - 0.5, 1)
	
	get_node('%cursor').transform.origin = cursor_pos

extends Node

class_name Statics

static func project_mouse_on_ground(viewport: Viewport) -> Vector3:
	var viewport_mouse := viewport.get_mouse_position()
	var mouse_pos := viewport.get_camera().project_ray_origin(viewport_mouse)
	var mouse_ray := viewport.get_camera().project_ray_normal(viewport_mouse)
	
	var target_y   := 0.0
	var ray_y_step := (target_y - mouse_pos.y) / mouse_ray.y
	var cursor_pos := mouse_pos + mouse_ray * ray_y_step
	
	assert(is_equal_approx(cursor_pos.y, target_y))
	return cursor_pos

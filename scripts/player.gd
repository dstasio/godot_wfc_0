extends Spatial



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().quit(0)
		
	var cursor_pos := Statics.project_mouse_on_ground(get_viewport())
	cursor_pos.x = stepify(cursor_pos.x - 0.5, 1)
	cursor_pos.z = stepify(cursor_pos.z - 0.5, 1)
	
	get_node('%cursor').transform.origin = cursor_pos


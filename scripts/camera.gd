extends Camera
class_name Sky_Camera

var is_panning: bool = false
var pan_start: Vector3

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_panning = Input.is_action_pressed("pan")
	if Input.is_action_just_pressed("pan"):
		pan_start = Statics.project_mouse_on_ground(get_viewport())
	
func _physics_process(delta):
	if is_panning:
		var current_mouse_pos := Statics.project_mouse_on_ground(get_viewport())
		transform.origin -= current_mouse_pos - pan_start

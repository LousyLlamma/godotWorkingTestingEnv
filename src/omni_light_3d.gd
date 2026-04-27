extends OmniLight3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_specular = 300
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var timeInSeconds = Time.get_ticks_usec()/1000000.0 #avoid integer division
	#light_specular += 3*delta;
	position.x = 3*cos(timeInSeconds)
	position.z = 3*sin(timeInSeconds)
	
	delta = delta
	
	pass

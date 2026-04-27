extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$textDisplay.text = "What a wonderful world! "


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		$textDisplay.text += "Don't you think? "
	delta = delta

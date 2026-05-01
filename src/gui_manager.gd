extends Control

@onready var textDisplay = $textDisplay
var option: int = 0
var cycle: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textDisplay.text = "What a wonderful world! "


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		
		var holder: Array[String] = ["First message", "Second MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond MessageSecond Message", "Third Message"]
		option = option + 1
		
		@warning_ignore("integer_division")
		textDisplay.text = holder[option % 3] + " - Cycle " + str(option/3)
	
	delta = delta

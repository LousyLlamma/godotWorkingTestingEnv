extends StaticBody3D

var activePoint: Vector2 = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spriteDimension = $Sprite3D.get_region_rect()
	var lengthOffset = spriteDimension.size.y
	var widthOffset = spriteDimension.size.x
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delta = delta
	

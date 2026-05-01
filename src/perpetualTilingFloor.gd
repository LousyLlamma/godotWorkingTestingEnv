extends StaticBody3D

var activePoint: Vector2 = Vector2(0,0)

@onready var spriteScene = load("res://Scenes/floorSprite.tscn")
@onready var activeSprites = spriteScene.instantiate()
@onready var spriteDimension = activeSprites.get_region_rect()
@onready var lengthOffset = spriteDimension.size.y
@onready var widthOffset = spriteDimension.size.x

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	activeSprites.position = Vector3(activePoint.x, 0, activePoint.y)
	add_child(activeSprites)
	activePoint.x += 0.01
	activePoint.y += 0.01
	delta = delta
	

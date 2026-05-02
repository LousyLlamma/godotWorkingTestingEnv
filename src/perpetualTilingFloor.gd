extends StaticBody3D


@onready var character = $"../CharacterBody3D"
@onready var spriteScene = load("res://Scenes/floorSprite.tscn")
var activePoint: Vector2
var relativePoint: Vector2
var activeSprites: Array[Sprite3D]
var spriteDimension
var lengthOffset
var widthOffset

var increment: int = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	activeSprites.resize(9)
	for i in range(9):
		activeSprites[i] = spriteScene.instantiate()
		
	spriteDimension = activeSprites[0].get_item_rect()
	lengthOffset = spriteDimension.size.y
	widthOffset = spriteDimension.size.x
	
	for i in range(9):
		add_child(activeSprites[i])
	

	
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	activePoint.x = move_toward(activePoint.x, character.position.x, 5*delta)
	activePoint.y = move_toward(activePoint.y, character.position.z, 5*delta)
	
	var spriteScale: Vector2 = Vector2(activeSprites[0].pixel_size*activeSprites[0].scale.x, activeSprites[0].pixel_size*activeSprites[0].scale.z)
	
	relativePoint.x += increment * delta
	relativePoint.y += increment * delta
	var movingPointX = activePoint.x + relativePoint.x
	var movingPointY = activePoint.y + relativePoint.y
	
	var index = 0
	
	for i in range(3):
		for j in range(3):
			activeSprites[index].position = Vector3(movingPointX + (i-1)*lengthOffset*spriteScale.x, 0, movingPointY + (j-1)*widthOffset*spriteScale.y)
			index += 1
			
	#activeSprites[0].position = Vector3(activePoint.x, 0, activePoint.y)
	#activeSprites[1].position = Vector3(activePoint.x + lengthOffset*spriteScale.x, 0, activePoint.y + widthOffset*spriteScale.y)
	
	
	if (abs(relativePoint.x) > 3):
		increment *= -1
	
	delta = delta
	

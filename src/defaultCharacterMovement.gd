extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var degreeOfRotation: float

var lastInput: Vector2 = Vector2(0,0)
var timeOfLastRelease: float
var timeOfDoubleTap: float

var keyPressManager: inputManager = inputManager.new(300.0)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	degreeOfRotation = atan2(input_dir.y, input_dir.x)
	
	
	
	$characterMesh.rotation = Vector3(0, degreeOfRotation, 0)
	if keyPressManager.detectDoubleTap(input_dir) == true:
		position += Vector3(input_dir.x, 0, input_dir.y)
	
	move_and_slide()

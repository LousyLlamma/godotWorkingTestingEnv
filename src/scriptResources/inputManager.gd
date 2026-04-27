class_name inputManager
extends Resource

var lastInput: Vector2 = Vector2(0,0)
var timeOfLastRelease: float
var timeOfDoubleTap: float
@export var dashCooldown: float

func _init(dashCD: float):
	dashCooldown = dashCD
	
func getLastRelease() -> Vector2:
	var release_dir: Vector2 = Vector2(0, 0)
	if Input.is_action_just_released("left"):
		release_dir += Vector2(-1,0)
	if Input.is_action_just_released("right"):
		release_dir += Vector2(1,0)
	if Input.is_action_just_released("up"):
		release_dir += Vector2(0, -1)
	if Input.is_action_just_released("down"):
		release_dir += Vector2(0, 1)
		
	
	#var timeSinceLastRelease = Time.get_ticks_msec() - timeOfLastRelease
	
	#if release_dir != Vector2(0, 0):
		#print("Time of last Release = ", timeOfLastRelease)
		#print("Actual time = ", Time.get_ticks_msec())
		#print("Time since release = ", timeSinceLastRelease)
	
	if (release_dir != Vector2(0, 0)):
		timeOfLastRelease = Time.get_ticks_msec()
	return release_dir.normalized()
	
func detectDoubleTap(input_dir: Vector2) -> bool:
	var currentRelease = getLastRelease()
	#print(lastInput)
	if currentRelease != Vector2(0,0) || Time.get_ticks_msec() - timeOfLastRelease  > dashCooldown - 100:
		lastInput = currentRelease
	
	if lastInput == Vector2(0,0):
		return false
	
	if lastInput == input_dir && not Time.get_ticks_msec() - timeOfDoubleTap < dashCooldown:
		timeOfDoubleTap = Time.get_ticks_msec()
		lastInput = Vector2(0,0)
		return true
		
	return false

extends KinematicBody
signal shoot_attempt

#export(PackedScene) var Bullet
export(float) var move_speed = 30.0
export(float) var jump_strength = 2.0

var gravity = 9.81

var minLookAngle = -90
var maxLookAngle = 90
var mouseSens = 15

var mousePosition = Vector2()
var playerVelocity = Vector3()
var localDir = Vector3()

onready var camera = get_node("Camera")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print(get_tree())
	#pass

func _process(delta):
	PlayerInputs(delta)
	_input(delta)
	
	camera.rotation_degrees.x -= mousePosition.y * mouseSens * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
	rotation_degrees.y -= mousePosition.x * mouseSens * delta
	
	mousePosition = Vector2()
	
func _physics_process(delta):
	playerVelocity.y -= gravity * delta
	localDir = move_and_slide(localDir * move_speed, Vector3.UP)
	
	var forwardDir = global_transform.basis.z
	var sidewaysDir = global_transform.basis.x
	
	localDir = (forwardDir * playerVelocity.z + sidewaysDir * playerVelocity.x + Vector3.UP * playerVelocity.y)

	if is_on_floor() and playerVelocity.y < 0:
		playerVelocity.y = 0
	#print(localDir.y)
	
func PlayerInputs(delta):
	playerVelocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	playerVelocity.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if Input.is_action_just_pressed("fire"):
		emit_signal("shoot_attempt")
		print("shoot")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		playerVelocity.y = jump_strength * 100 * delta
		print("jump")
		
	
func _input(event):
	if event is InputEventMouseMotion:
		mousePosition = event.relative

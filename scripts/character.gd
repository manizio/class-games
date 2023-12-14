extends CharacterBody2D

var SPEED = 200.0
var interact = false
@onready var john = $"../Ponte"

var view_rect = get_viewport_rect()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# player movement limitations
var min_x = 0
var max_x = 0
var min_y = 0
var max_y = 0

func _process(delta):
	if interact and Input.is_action_just_pressed("action"):
		john.get_node("TextEdit").visible = true
		john.get_node("TextEdit").text = "imagine"
		john.get_node("FadeTimer").start()
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true
		
	
func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	
	if Input.is_action_pressed("sprint"):
		SPEED = 300
	if Input.is_action_just_released("sprint"):
		SPEED = 200
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = 0
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = 0
	
	velocity.normalized()
	move_and_slide()

	#position.x = clamp(position.x, min_x, max_x)
	#position.y = clamp(position.y, min_y, max_y)

	#$Camera2D.limit_left = min_x
	#$Camera2D.limit_right = max_x
	#$Camera2D.limit_top = min_y
	#$Camera2D.limit_bottom = max_y
	#
	
func limit_movement(pos_x, pos_y, end_x, end_y):
	min_x = pos_x
	max_x = end_x
	
	min_y = pos_y
	max_y = end_y

func _on_area_2d_body_entered(body):
	interact = true

func _on_area_2d_body_exited(body):
	interact = false
	

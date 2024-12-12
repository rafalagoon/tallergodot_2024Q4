extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var jumping:bool = false

var angle = 0.0


func _ready() -> void:
	Globals.Player = self


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("game_fire"):
		var bullet:Node3D = $ResourcePreloader.get_resource("bala").instantiate()
		get_parent().add_child(bullet)
		
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumping = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jumping = true
		velocity.y = JUMP_VELOCITY
		$Body/AnimationPlayer.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(0, 0, input_dir.y)).normalized()

	angle -= input_dir.x

	rotation_degrees.y = angle

	if direction:
		if not jumping:
			$Body/AnimationPlayer.play("walk")
			
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		if not jumping:
			$Body/AnimationPlayer.play("idle")

		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

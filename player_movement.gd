extends CharacterBody2D
const SPEED = 600
const ACCELERATION = 10
const DECCELERATION = 50
const GENERATE_TIME = 120
var current_time = 0
var gold:Node2D

func _ready() -> void:
	gold = get_tree().get_first_node_in_group("gold")

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("debug_1"):
		print(abs(Vector2(position-gold.position).length()))
	var Xaxis = Input.get_axis("move_left", "move_right")
	var Yaxis = Input.get_axis("move_down", "move_up")
	if Xaxis:
		velocity.x = move_toward(velocity.x, SPEED*Xaxis, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, DECCELERATION)
		
	if Yaxis:
		velocity.y = move_toward(velocity.y, SPEED*-Yaxis, ACCELERATION)
	else:
		velocity.y = move_toward(velocity.y, 0, DECCELERATION)
	$Sprite2D.rotation+= velocity.length()/3000
	if velocity.length() > 0:
		$CPUParticles2D.emitting = true
		if current_time <=0:
			current_time = GENERATE_TIME
			$CPUParticles2D.set_amount(velocity.length()/10)
		else:
			current_time -= 1
	else:
		$CPUParticles2D.emitting = false
		current_time = 0
	move_and_slide()

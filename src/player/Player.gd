extends CharacterBody2D

@export var speed: int = 65

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(_delta):
	var horizontal_direction: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = horizontal_direction * speed
	move_and_slide()
	
	if is_zero_approx(velocity.x):
		animation_player.play("Idle")
	else:
		animation_player.play("Move")
		
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false


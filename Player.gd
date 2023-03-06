extends CharacterBody2D

@export var speed = 80
@export var rotation_speed = 0.8

@onready var bar = $BarCollisionShape2D

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	bar.rotation +=  rotation_speed * delta
	
	move_and_slide()

extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var chase = false
@onready var anima = $AnimatedSprite2D
var alive = true
var speed = 100

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../../player/player"
	var direction = (player.position - self.position).normalized()
	
	if alive == true:
		if chase == true:
			velocity.x = direction.x * speed
			anima.play("run")
		else:
			velocity.x = 0
			anima.play("afk")
		if direction.x < 0:
			$AnimatedSprite2D.flip_h= true
		else:
			$AnimatedSprite2D.flip_h= false
	move_and_slide()



func _on_зона_обнаружения_body_entered(body):
	if body.name == "player":
		chase = true


func _on_зона_обнаружения_body_exited(body):
	if body.name == "player":
		chase = false


func _on_death_body_entered(body):
	if body.name == "player":
		body.velocity.y = -300
		death()

func _on_death_2_body_entered(body):
	if body.name == "player":
		if alive == true:
			body.health -= 1

func death ():
	alive = false
	anima.play("death")
	await anima.animation_finished
	queue_free()




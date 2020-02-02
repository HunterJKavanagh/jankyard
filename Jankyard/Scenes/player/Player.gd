extends KinematicBody2D

const lib = preload("res://Lib.gd")

export (int) var speed = 500

var selected_tool = lib.TOOLS.tool1

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
		rotation_degrees = 0
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		rotation_degrees = 180
	if Input.is_action_pressed('down'):
		velocity.y += 1
		rotation_degrees = 90
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		rotation_degrees = 270
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func _on_Door_body_entered(body):
	print("it worked")

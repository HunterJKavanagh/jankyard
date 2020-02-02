extends KinematicBody2D

const lib = preload("res://lib.gd")

func _ready():
	self.connect("input_event", self.get_parent(), "_on_TestCharacter_input_event")

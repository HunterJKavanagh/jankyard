extends KinematicBody2D

const lib = preload("res://lib.gd")

func _ready():
	self.set_meta("character", lib.CHARACTERS.test_character)
	self.set_meta("level_postions", {
		lib.LEVELS.level_3: Vector2(800,100),
	})

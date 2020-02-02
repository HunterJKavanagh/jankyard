extends KinematicBody2D

const lib = preload("res://Lib.gd")

func _ready():
	self.set_meta("character", lib.CHARACTERS._5U_CC)
	self.set_meta("level_postions", {
		lib.LEVELS.hub: Vector2(1000,200),
		lib.LEVELS.level_2: Vector2(200,100),
	})

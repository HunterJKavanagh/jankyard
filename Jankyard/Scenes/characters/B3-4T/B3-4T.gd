extends KinematicBody2D

const lib = preload("res://Lib.gd")

func _ready():
	self.set_meta("character", lib.CHARACTERS.B3_4T)
	self.set_meta("level_postions", {
		lib.LEVELS.hub: Vector2(700,400),
		lib.LEVELS.level_2: Vector2(200,100),
	})

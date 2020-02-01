tool

extends Node2D

const lib = preload("res://lib.gd")

onready var level = load("res://Scenes/level/Level.tscn").instance()

func _ready():
	add_child(level)
	
	level.connect("door_entered", self, "on_level_door_entered")

func on_level_door_entered(dir):
	print(dir)

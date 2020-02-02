extends Node

const lib = preload("res://Lib.gd")

onready var Dialog = $"../UI/UI/Dialog"

signal character_clicked

func _ready():
	var children = self.get_children()
	for c in children:
		if c.has_meta("character"):
			match c.get_meta("character"):
				lib.CHARACTERS._3V_1L:
					c.connect("input_event", self, "_on_3V_1L_input_event")
				lib.CHARACTERS.test_character:
					c.connect("input_event", self, "_on_TestCharacter_input_event")

func move_characters(level_name):
	var children = self.get_children()
	for c in children:
		c.position = Vector2(-100, -100)
	for c in children:
		if c.has_meta("level_postions"):
			var level_postions = c.get_meta("level_postions")
			for k in level_postions.keys():
				if k == level_name:
					c.position = level_postions[k]

func _on_3V_1L_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			print("click")
			Dialog.visible = true
			Dialog.set_mouse_filter(0) 
			emit_signal("character_clicked", lib.CHARACTERS._3V_1L)
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_RIGHT:
			Dialog.visible = false
			Dialog.set_mouse_filter(2)

func _on_TestCharacter_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			Dialog.visible = true
			Dialog.set_mouse_filter(0)
			emit_signal("character_clicked", lib.CHARACTERS.test_character)
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_RIGHT:
			Dialog.set_mouse_filter(2)

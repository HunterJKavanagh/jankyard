extends StaticBody2D

const lib = preload("res://lib.gd")

func _ready():
	self.set_meta("obj", lib.OBJ.test_obj)


func _on_TestObj_input_event(viewport, event, shape_idx):
	pass # Replace with function body.

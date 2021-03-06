extends StaticBody2D

const lib = preload("res://lib.gd")

signal obj_clicked

func _ready():
	self.set_meta("obj", lib.OBJ.glue)


func _on_Glue_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			emit_signal("obj_clicked", self.get_meta("obj"), lib.LEFT, self)
			self.queue_free()
		if event.pressed and event.button_index == BUTTON_RIGHT:
			emit_signal("obj_clicked", self.get_meta("obj"), lib.RIGHT, self)

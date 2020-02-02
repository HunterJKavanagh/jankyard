extends Node2D

const lib = preload("res://lib.gd")

signal door_entered

signal character_clicked

func _ready():
	pass

func _process(delta):
	pass

func _on_DoorU_body_entered(body):
	emit_signal("door_entered", lib.DIR.up)

func _on_DoorD_body_entered(body):
	emit_signal("door_entered", lib.DIR.down)

func _on_DoorL_body_entered(body):
	emit_signal("door_entered", lib.DIR.left)

func _on_DoorR_body_entered(body):
	emit_signal("door_entered", lib.DIR.right)

func _on_TestCharacter_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			var start_vis = $"../../UI/Dialog".visible
			if $"../../UI/Dialog".visible:
				print_debug([start_vis, $"../../UI/Dialog".visible])
				$"../../UI/Dialog".visible = false
			else:
				$"../../UI/Dialog".visible = true
				print_debug([start_vis, $"../../UI/Dialog".visible])
				emit_signal("character_clicked", lib.CHARACTERS.test_character)

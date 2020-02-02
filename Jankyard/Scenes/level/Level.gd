extends Node2D

const lib = preload("res://lib.gd")

signal door_entered

func _ready():
	self.set_meta("level", true)
	
	var objs = get_children()
	for o in objs:
		if o.has_meta("obj"):
			if o.has_node("AnimatedSprite"):
				if $"..".data["Animat"][o.get_meta("obj")] != null:
					o.get_node("AnimatedSprite").animation = $"..".data["Animat"][o.get_meta("obj")]
			if o.has_node("CollisionShape2D"):
				if o.get_meta("obj") == lib.OBJ.pit:
					print("enter1: " + $"..".data["Collision"][o.get_meta("obj")] as String)
				o.get_node("CollisionShape2D").disabled = $"..".data["Collision"][o.get_meta("obj")]
				if o.get_meta("obj") == lib.OBJ.pit:
					
					print("enter2: " + o.get_node("CollisionShape2D").disabled as String)

func _exit_tree():
	var objs = get_children()
	for o in objs:
		if o.has_meta("obj"):
			if o.has_node("AnimatedSprite"):
				$"..".data["Animat"][o.get_meta("obj")] = o.get_node("AnimatedSprite").animation
			if o.has_node("CollisionShape2D"):
				if o.get_meta("obj") == lib.OBJ.pit:
					print("exit: " + o.get_node("CollisionShape2D").disabled as String)
				$"..".data["Collision"][o.get_meta("obj")] = o.get_node("CollisionShape2D").disabled

func _on_DoorU_body_entered(body):
	emit_signal("door_entered", lib.DIR.up)

func _on_DoorD_body_entered(body):
	emit_signal("door_entered", lib.DIR.down)

func _on_DoorL_body_entered(body):
	emit_signal("door_entered", lib.DIR.left)

func _on_DoorR_body_entered(body):
	emit_signal("door_entered", lib.DIR.right)

func _on_3V_1L_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			print("click")
			$"../UI/UI/Dialog".visible = true
			emit_signal("character_clicked", lib.CHARACTERS._3V_1L)
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_RIGHT:
			$"../UI/UI/Dialog".visible = false

func _on_TestCharacter_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			$"../UI/UI/Dialog".visible = true
			emit_signal("character_clicked", lib.CHARACTERS.test_character)
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_RIGHT:
			$"../UI/UI/Dialog".visible = false

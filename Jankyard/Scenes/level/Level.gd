extends Node2D

const lib = preload("res://lib.gd")

signal door_entered

func _ready():
	pass

func _process(delta):
	pass


func _on_DoorU_body_entered(body):
	emit_signal("door_entered", lib.DOOR.up)


func _on_DoorD_body_entered(body):
	emit_signal("door_entered", lib.DOOR.down)


func _on_DoorL_body_entered(body):
	emit_signal("door_entered", lib.DOOR.left)


func _on_DoorR_body_entered(body):
	emit_signal("door_entered", lib.DOOR.right)

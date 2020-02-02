extends Control

signal continue_dialog_pressed


func _on_ToolBoxButton_pressed():
	$ToolBox.visible = true;


func _on_Button_pressed():
	$ToolBox.visible = false;


func _on_Continue_pressed():
	emit_signal("continue_dialog_pressed")

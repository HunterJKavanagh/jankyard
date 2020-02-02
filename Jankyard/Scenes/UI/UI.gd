extends Control

signal continue_dialog_pressed


func _on_ToolBoxButton_pressed():
	$ToolBox.visible = true;


func _on_Button_pressed():
	$ToolBox.visible = false;


func _on_Continue_pressed():
	emit_signal("continue_dialog_pressed")


func _on_InventoryButton_pressed():
	if $Inventory.visible:
		$Inventory.visible = false
		$Inventory.set_mouse_filter(2) 
	else:
		$Inventory.visible = true
		$Inventory.set_mouse_filter(0) 

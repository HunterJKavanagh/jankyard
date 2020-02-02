extends Control

signal continue_dialog_pressed

signal tool_button_pressed

const lib = preload("res://lib.gd")

func _ready():
	turn_of_buttons()
	$Inventory/Panel/VBox/Hands.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.hands)

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

func turn_of_buttons():
	$Inventory/Panel/VBox/Tool1.set_pressed(false)
	$Inventory/Panel/VBox/Tool2.set_pressed(false)
	$Inventory/Panel/VBox/Tool3.set_pressed(false)
	$Inventory/Panel/VBox/Tool4.set_pressed(false)
	$Inventory/Panel/VBox/Tool5.set_pressed(false)
	$Inventory/Panel/VBox/Tool6.set_pressed(false)
	$Inventory/Panel/VBox/Hands.set_pressed(false)


func _on_Tool1_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Tool1.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.glue)

func _on_Tool2_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Tool2.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.tool2)

func _on_Tool3_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Tool3.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.tool3)

func _on_Tool4_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Tool4.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.tool4)

func _on_Tool5_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Tool5.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.tool5)


func _on_Tool6_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Tool6.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.tool6)


func _on_Item1_pressed():
	pass # Replace with function body.


func _on_Item2_pressed():
	pass # Replace with function body.


func _on_Item3_pressed():
	pass # Replace with function body.


func _on_Item4_pressed():
	pass # Replace with function body.


func _on_Item5_pressed():
	pass # Replace with function body.


func _on_Hands_pressed():
	turn_of_buttons()
	$Inventory/Panel/VBox/Hands.set_pressed(true)
	emit_signal("tool_button_pressed", lib.TOOLS.hands)

extends Node2D

const lib = preload("res://lib.gd")

func _ready():
	$Map.connect("level_change", self, "on_level_change")

func on_level_change(dir):
	match dir:
		lib.DIR.up:
			$Player.position = $Map.player_postions[lib.DIR.down]
		lib.DIR.right:
			$Player.position = $Map.player_postions[lib.DIR.left]
		lib.DIR.down:
			$Player.position = $Map.player_postions[lib.DIR.up]
		lib.DIR.left:
			$Player.position = $Map.player_postions[lib.DIR.right]

func _on_Character_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			var dis = sqrt(pow($Player.position.x - $Character.position.x, 2) + pow($Player.position.y - $Character.position.y, 2))
			if dis <= 100:
				$UI/P2/TextBox.text += "Don't Click Me!"

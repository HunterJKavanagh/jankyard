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

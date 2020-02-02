extends Node2D

const lib = preload("res://lib.gd")

func _ready():
	$Map.connect("level_change", self, "on_level_change")

func on_level_change(dir):
	#$Map.level.connect("character_clicked", $Map, "on_character_clicked")
	match dir:
		lib.DIR.up:
			$Player.position = $Map.player_postions[lib.DIR.down]
		lib.DIR.right:
			$Player.position = $Map.player_postions[lib.DIR.left]
		lib.DIR.down:
			$Player.position = $Map.player_postions[lib.DIR.up]
		lib.DIR.left:
			$Player.position = $Map.player_postions[lib.DIR.right]

#func on_character_clicked(character):
#	match character:
#		lib.CHARACHTERS.test_character:
#			$UI/Dialog/CharacterDialogPanel/RichTextLabel.text = lib.DATA["dialog"][character][lib.DATA["dialog_counter"][character]["level"]][lib.DATA["dialog_counter"][character]["line"]]

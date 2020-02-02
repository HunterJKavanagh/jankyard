tool

extends Node2D

const lib = preload("res://Lib.gd")

signal level_change

var map: lib.Graph = lib.Graph.new()

var level_name = lib.LEVELS.level_1
var level
var current_character

var player_postions: Dictionary = {
		lib.DIR.up: Vector2(512, 30),
		lib.DIR.right: Vector2(994, 300),
		lib.DIR.down: Vector2(512, 570),
		lib.DIR.left: Vector2(30, 300),
		}

var dialog_counter: Dictionary = {
	lib.CHARACTERS.test_character: {
		"line": 0,
		"level": 0,
	},
	lib.CHARACTERS.broken_robot_1: {
		"line": 0,
		"level": 0,
	},
	lib.CHARACTERS.broken_robot_2: {
		"line": 0,
		"level": 0,
	},
	lib.CHARACTERS.broken_robot_3: {
		"line": 0,
		"level": 0,
	},
	lib.CHARACTERS._3V_1L: {
		"line": 0,
		"level": 0,
	},
}

func _ready():
	connect("level_change", self, "on_level_change")
	
	# setting up map
	map.add_vertex(lib.LEVELS.level_1, {"path": "res://Scenes/level/levels/level_1.tscn"})
	map.add_vertex(lib.LEVELS.level_2, {"path": "res://Scenes/level/levels/level_2.tscn"})
	map.add_vertex(lib.LEVELS.level_3, {"path": "res://Scenes/level/levels/level_3.tscn"})
	map.add_vertex(lib.LEVELS.level_4, {"path": "res://Scenes/level/levels/level_4.tscn"})
	map.add_vertex(lib.LEVELS.level_5, {"path": "res://Scenes/level/levels/level_5.tscn"})
	map.add_vertex(lib.LEVELS.level_6, {"path": "res://Scenes/level/levels/level_6.tscn"})
	map.add_vertex(lib.LEVELS.level_7, {"path": "res://Scenes/level/levels/level_7.tscn"})
	map.add_vertex(lib.LEVELS.level_8, {"path": "res://Scenes/level/levels/level_8.tscn"})
	map.add_vertex(lib.LEVELS.level_9, {"path": "res://Scenes/level/levels/level_9.tscn"})
	
	#setting up rooms
#pog
	map.add_vertex(lib.LEVELS.hub, {"path": "res://Scenes/level/levels/hub.tscn"})
	map.add_vertex(lib.LEVELS.first_bridge, {"path": "res://Scenes/level/levels/first_bridge.tscn"})
	map.add_vertex(lib.LEVELS.first_ramp, {"path": "res://Scenes/level/levels/first_ramp.tscn"})
	map.add_vertex(lib.LEVELS.conveyor, {"path": "res://Scenes/level/levels/conveyor.tscn"})
	map.add_vertex(lib.LEVELS.walkie, {"path": "res://Scenes/level/levels/walkie.tscn"})
	map.add_vertex(lib.LEVELS.cog_1, {"path": "res://Scenes/level/levels/cog_1.tscn"})
	map.add_vertex(lib.LEVELS.cog_2, {"path": "res://Scenes/level/levels/cog_2.tscn"})
	map.add_vertex(lib.LEVELS.cog_3, {"path": "res://Scenes/level/levels/cog_3.tscn"})
	map.add_vertex(lib.LEVELS.cog_4, {"path": "res://Scenes/level/levels/cog_4.tscn"})
	map.add_vertex(lib.LEVELS.plant, {"path": "res://Scenes/level/levels/plant.tscn"})
	map.add_vertex(lib.LEVELS.con, {"path": "res://Scenes/level/levels/con.tscn"})
#plants
	map.add_vertex(lib.LEVELS.garbo, {"path": "res://Scenes/level/levels/garbo.tscn"})
	map.add_vertex(lib.LEVELS.planto, {"path": "res://Scenes/level/levels/planto.tscn"})
	map.add_vertex(lib.LEVELS.saw, {"path": "res://Scenes/level/levels/saw.tscn"})
	map.add_vertex(lib.LEVELS.stakes, {"path": "res://Scenes/level/levels/stakes.tscn"})
	map.add_vertex(lib.LEVELS.tree, {"path": "res://Scenes/level/levels/tree.tscn"})
	map.add_vertex(lib.LEVELS.stake_2, {"path": "res://Scenes/level/levels/stake_2.tscn"})
	map.add_vertex(lib.LEVELS.walls, {"path": "res://Scenes/level/levels/walls.tscn"})
	map.add_vertex(lib.LEVELS.succ_2, {"path": "res://Scenes/level/levels/succ_2.tscn"})
	map.add_vertex(lib.LEVELS.orotto, {"path": "res://Scenes/level/levels/orotto.tscn"})
	map.add_vertex(lib.LEVELS.stake_3, {"path": "res://Scenes/level/levels/stake_3.tscn"})
	map.add_vertex(lib.LEVELS.roboto, {"path": "res://Scenes/level/levels/roboto.tscn"})
#robots
	map.add_vertex(lib.LEVELS.bot, {"path": "res://Scenes/level/levels/bot.tscn"})
	map.add_vertex(lib.LEVELS.borken, {"path": "res://Scenes/level/levels/borken.tscn"})
	map.add_vertex(lib.LEVELS.feel_alive, {"path": "res://Scenes/level/levels/feel_alive.tscn"})
	map.add_vertex(lib.LEVELS.pogchamp, {"path": "res://Scenes/level/levels/pogchamp.tscn"})
#Cars
	map.add_vertex(lib.LEVELS.scrapmobile, {"path": "res://Scenes/level/levels/scrapmobile.tscn"})
	map.add_vertex(lib.LEVELS.speaker, {"path": "res://Scenes/level/levels/speaker.tscn"})
	map.add_vertex(lib.LEVELS.succ, {"path": "res://Scenes/level/levels/succ.tscn"})
	map.add_vertex(lib.LEVELS.whistling_jackhammer, {"path": "res://Scenes/level/levels/whistling_jackhammer.tscn"})
	map.add_vertex(lib.LEVELS.succor, {"path": "res://Scenes/level/levels/succor.tscn"})
	map.add_vertex(lib.LEVELS.why, {"path": "res://Scenes/level/levels/why.tscn"})
	map.add_vertex(lib.LEVELS.gardener, {"path": "res://Scenes/level/levels/gardener.tscn"})
#sinkhole
	map.add_vertex(lib.LEVELS.dirk, {"path": "res://Scenes/level/levels/dirk.tscn"})
	map.add_vertex(lib.LEVELS.sink, {"path": "res://Scenes/level/levels/sink.tscn"})
#construction
	map.add_vertex(lib.LEVELS.minecraft_construction_area, {"path": "res://Scenes/level/levels/minecraft_construction_area.tscn"})
	map.add_vertex(lib.LEVELS.infinity, {"path": "res://Scenes/level/levels/infinity.tscn"})
	map.add_vertex(lib.LEVELS.reck, {"path": "res://Scenes/level/levels/reck.tscn"})
	map.add_vertex(lib.LEVELS.placeholder, {"path": "res://Scenes/level/levels/placeholder.tscn"})
	map.add_vertex(lib.LEVELS.garbage, {"path": "res://Scenes/level/levels/garbage.tscn"})
	map.add_vertex(lib.LEVELS.magneto, {"path": "res://Scenes/level/levels/magneto.tscn"})
	map.add_vertex(lib.LEVELS.mixer, {"path": "res://Scenes/level/levels/mixer.tscn"})
	map.add_vertex(lib.LEVELS.gemeni, {"path": "res://Scenes/level/levels/gemeni.tscn"})
	map.add_vertex(lib.LEVELS.ralph, {"path": "res://Scenes/level/levels/ralph.tscn"})
	map.add_vertex(lib.LEVELS.welding, {"path": "res://Scenes/level/levels/welding.tscn"})
	map.add_vertex(lib.LEVELS.byeah, {"path": "res://Scenes/level/levels/byeah.tscn"})
#incinerator
	map.add_vertex(lib.LEVELS.warm, {"path": "res://Scenes/level/levels/warm.tscn"})
	map.add_vertex(lib.LEVELS.backwards, {"path": "res://Scenes/level/levels/backwards.tscn"})
	map.add_vertex(lib.LEVELS.succ_3, {"path": "res://Scenes/level/levels/succ_3.tscn"})
	map.add_vertex(lib.LEVELS.incins_big_win, {"path": "res://Scenes/level/levels/incins_big_win.tscn"})
	map.add_vertex(lib.LEVELS.incin_1, {"path": "res://Scenes/level/levels/incin_1.tscn"})
	map.add_vertex(lib.LEVELS.incin_2, {"path": "res://Scenes/level/levels/incin_2.tscn"})
	map.add_vertex(lib.LEVELS.incin_3, {"path": "res://Scenes/level/levels/incin_3.tscn"})
	map.add_vertex(lib.LEVELS.incin_4, {"path": "res://Scenes/level/levels/incin_4.tscn"})
	map.add_vertex(lib.LEVELS.papier, {"path": "res://Scenes/level/levels/papier.tscn"})
	map.add_vertex(lib.LEVELS.alternia, {"path": "res://Scenes/level/levels/alternia.tscn"})
	
#room connections
	
	# (0,0)
	map.add_edge(lib.DIR.up, lib.LEVELS.level_1, lib.LEVELS.level_2)
	map.add_edge(lib.DIR.right, lib.LEVELS.level_1, lib.LEVELS.level_3)
	map.add_edge(lib.DIR.down, lib.LEVELS.level_1, lib.LEVELS.level_4)
	map.add_edge(lib.DIR.left, lib.LEVELS.level_1, lib.LEVELS.level_5)
	
	#(0,1)
	map.add_edge(lib.DIR.right, lib.LEVELS.level_2, lib.LEVELS.level_6)
	map.add_edge(lib.DIR.left, lib.LEVELS.level_2, lib.LEVELS.level_9)
	
	# (0,-1)
	map.add_edge(lib.DIR.right, lib.LEVELS.level_4, lib.LEVELS.level_7)
	map.add_edge(lib.DIR.left, lib.LEVELS.level_4, lib.LEVELS.level_8)
	
	# (1, 0)
	map.add_edge(lib.DIR.up, lib.LEVELS.level_3, lib.LEVELS.level_6)
	map.add_edge(lib.DIR.down, lib.LEVELS.level_3, lib.LEVELS.level_7)
#
	# (-1,0)
	map.add_edge(lib.DIR.up, lib.LEVELS.level_5, lib.LEVELS.level_9)
	map.add_edge(lib.DIR.down, lib.LEVELS.level_5, lib.LEVELS.level_8)
	
	# settign up level
	var level = load(map.vertices[level_name].data["path"]).instance()
	add_child(level)
	level.connect("door_entered", self, "on_level_door_entered")
	
	$Characters.connect("character_clicked", self, "on_character_clicked")
	$UI/UI.connect("continue_dialog_pressed", self, "on_continue_dialog_pressed")
	
	print("ready")
	
func on_level_change(dir):
	match dir:
		lib.DIR.up:
			$Player.position = player_postions[lib.DIR.down]
		lib.DIR.right:
			$Player.position = player_postions[lib.DIR.left]
		lib.DIR.down:
			$Player.position = player_postions[lib.DIR.up]
		lib.DIR.left:
			$Player.position = player_postions[lib.DIR.right]

func on_level_door_entered(dir):
	print(dir)
	
	match dir:
		lib.DIR.up:
			if map.vertices[level_name].data["door_data"][dir]:
				level_name = map.vertices[level_name].connections[lib.DIR.up]
				remove_child(level)
				level = load(map.vertices[level_name].data["path"]).instance()
				add_child(level)
				emit_signal("level_change", dir)
		lib.DIR.right:
			if map.vertices[level_name].data["door_data"][dir]:
				level_name = map.vertices[level_name].connections[lib.DIR.right]
				remove_child(level)
				level = load(map.vertices[level_name].data["path"]).instance()
				add_child(level)
				emit_signal("level_change", dir)
		lib.DIR.down:
			if map.vertices[level_name].data["door_data"][dir]:
				level_name = map.vertices[level_name].connections[lib.DIR.down]
				remove_child(level)
				level = load(map.vertices[level_name].data["path"]).instance()
				add_child(level)
				emit_signal("level_change", dir)
		lib.DIR.left:
			if map.vertices[level_name].data["door_data"][dir]:
				level_name = map.vertices[level_name].connections[lib.DIR.left]
				remove_child(level)
				level = load(map.vertices[level_name].data["path"]).instance()
				add_child(level)
				emit_signal("level_change", dir)
	$Characters.move_characters(level_name)

func on_character_clicked(character):
	current_character = character
	var line = dialog_counter[character]["line"]
	var text = lib.DIALOG[character][dialog_counter[character]["level"]][line]
	$"UI/UI/Dialog/CharacterDialogPanel/RichTextLabel".text = text
	print(text)

func on_continue_dialog_pressed():
	var line = dialog_counter[current_character]["line"]
	
	if line + 1 < lib.DIALOG[current_character][dialog_counter[current_character]["level"]].size():
		dialog_counter[current_character]["line"] = line + 1
		line += 1
	
	$"UI/UI/Dialog/CharacterDialogPanel/RichTextLabel".text = lib.DIALOG[current_character][dialog_counter[current_character]["level"]][line]


func _on_Button_pressed():
	$Characters.move_characters(level_name)
	$UI/Button.queue_free()

tool

extends Node2D

const lib = preload("res://lib.gd")

signal level_change

var map: lib.Graph = lib.Graph.new()

var level_name = lib.LEVELS.hub
var level
var current_character

var data: Dictionary = {
	
}

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
	map.add_vertex(lib.LEVELS.con, {"path": "res://Scenes/level/levels/con_1.tscn"})
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

#pog

#hub
	map.add_edge(lib.DIR.left, lib.LEVELS.hub, lib.LEVELS.scrapmobile)
	map.add_edge(lib.DIR.down, lib.LEVELS.hub, lib.LEVELS.first_bridge)
	map.add_edge(lib.DIR.right, lib.LEVELS.hub, lib.LEVELS.cog_1)
#first_bridge
	map.add_edge(lib.DIR.up, lib.LEVELS.first_bridge, lib.LEVELS.hub)
	map.add_edge(lib.DIR.down, lib.LEVELS.first_bridge, lib.LEVELS.first_ramp)
#first_ramp
	map.add_edge(lib.DIR.up, lib.LEVELS.first_ramp, lib.LEVELS.first_bridge)
	map.add_edge(lib.DIR.right, lib.LEVELS.first_ramp, lib.LEVELS.conveyor)
#conveyor
	map.add_edge(lib.DIR.left, lib.LEVELS.conveyor, lib.LEVELS.first_ramp)
	map.add_edge(lib.DIR.up, lib.LEVELS.conveyor, lib.LEVELS.walkie)
	map.add_edge(lib.DIR.down, lib.LEVELS.conveyor, lib.LEVELS.warm)
#walkie
	map.add_edge(lib.DIR.down, lib.LEVELS.walkie, lib.LEVELS.conveyor)
	map.add_edge(lib.DIR.right, lib.LEVELS.walkie, lib.LEVELS.con)
	map.add_edge(lib.DIR.up, lib.LEVELS.walkie, lib.LEVELS.cog_1)
#cog_1
	map.add_edge(lib.DIR.left, lib.LEVELS.cog_1, lib.LEVELS.hub)
	map.add_edge(lib.DIR.down, lib.LEVELS.cog_1, lib.LEVELS.walkie)
	map.add_edge(lib.DIR.right, lib.LEVELS.cog_1, lib.LEVELS.cog_2)
	map.add_edge(lib.DIR.up, lib.LEVELS.cog_1, lib.LEVELS.cog_4)
#cog_2
	map.add_edge(lib.DIR.left, lib.LEVELS.cog_2, lib.LEVELS.cog_1)
	map.add_edge(lib.DIR.up, lib.LEVELS.cog_2, lib.LEVELS.cog_3)
#cog_3
	map.add_edge(lib.DIR.left, lib.LEVELS.cog_3, lib.LEVELS.cog_4)
	map.add_edge(lib.DIR.down, lib.LEVELS.cog_3, lib.LEVELS.cog_2)
	map.add_edge(lib.DIR.right, lib.LEVELS.cog_3, lib.LEVELS.pogchamp)
#cog_4
	map.add_edge(lib.DIR.left, lib.LEVELS.cog_4, lib.LEVELS.plant)
	map.add_edge(lib.DIR.down, lib.LEVELS.cog_4, lib.LEVELS.cog_1)
	map.add_edge(lib.DIR.right, lib.LEVELS.cog_4, lib.LEVELS.cog_3)
#plant
	map.add_edge(lib.DIR.up, lib.LEVELS.plant, lib.LEVELS.garbo)
	map.add_edge(lib.DIR.right, lib.LEVELS.plant, lib.LEVELS.cog_4)
#con
	map.add_edge(lib.DIR.left, lib.LEVELS.con, lib.LEVELS.walkie)
	map.add_edge(lib.DIR.right, lib.LEVELS.con, lib.LEVELS.byeah)

#plants

#garbo
	map.add_edge(lib.DIR.down, lib.LEVELS.garbo, lib.LEVELS.plant)
	map.add_edge(lib.DIR.right, lib.LEVELS.garbo, lib.LEVELS.planto)
	map.add_edge(lib.DIR.up, lib.LEVELS.garbo, lib.LEVELS.stake_2)
#planto
	map.add_edge(lib.DIR.left, lib.LEVELS.planto, lib.LEVELS.garbo)
	map.add_edge(lib.DIR.right, lib.LEVELS.planto, lib.LEVELS.saw)
#saw
	map.add_edge(lib.DIR.left, lib.LEVELS.saw, lib.LEVELS.planto)
	map.add_edge(lib.DIR.up, lib.LEVELS.saw, lib.LEVELS.stakes)
#stakes
	map.add_edge(lib.DIR.down, lib.LEVELS.stakes, lib.LEVELS.saw)
	map.add_edge(lib.DIR.left, lib.LEVELS.stakes, lib.LEVELS.tree)
#tree
	map.add_edge(lib.DIR.left, lib.LEVELS.tree, lib.LEVELS.stake_2)
	map.add_edge(lib.DIR.up, lib.LEVELS.tree, lib.LEVELS.stake_3)
	map.add_edge(lib.DIR.right, lib.LEVELS.tree, lib.LEVELS.stakes)
#stake_2
	map.add_edge(lib.DIR.down, lib.LEVELS.stake_2, lib.LEVELS.garbo)
	map.add_edge(lib.DIR.right, lib.LEVELS.stake_2, lib.LEVELS.tree)
	map.add_edge(lib.DIR.up, lib.LEVELS.stake_2, lib.LEVELS.walls)
#walls
	map.add_edge(lib.DIR.left, lib.LEVELS.walls, lib.LEVELS.gardener)
	map.add_edge(lib.DIR.up, lib.LEVELS.walls, lib.LEVELS.succ_2)
	map.add_edge(lib.DIR.down, lib.LEVELS.walls, lib.LEVELS.stake_2)
#succ_2
	map.add_edge(lib.DIR.down, lib.LEVELS.succ_2, lib.LEVELS.walls)
	map.add_edge(lib.DIR.right, lib.LEVELS.succ_2, lib.LEVELS.orotto)
	map.add_edge(lib.DIR.up, lib.LEVELS.succ_2, lib.LEVELS.dirk)
#orotto
	map.add_edge(lib.DIR.left, lib.LEVELS.orotto, lib.LEVELS.succ_2)
	map.add_edge(lib.DIR.down, lib.LEVELS.orotto, lib.LEVELS.stake_3)
#stake_3
	map.add_edge(lib.DIR.up, lib.LEVELS.stake_3, lib.LEVELS.orotto)
	map.add_edge(lib.DIR.right, lib.LEVELS.stake_3, lib.LEVELS.roboto)
	map.add_edge(lib.DIR.down, lib.LEVELS.stake_3, lib.LEVELS.tree)
#roboto
	map.add_edge(lib.DIR.left, lib.LEVELS.roboto, lib.LEVELS.stake_3)
	map.add_edge(lib.DIR.right, lib.LEVELS.roboto, lib.LEVELS.bot)

#robots

#bot
	map.add_edge(lib.DIR.left, lib.LEVELS.bot, lib.LEVELS.roboto)
	map.add_edge(lib.DIR.down, lib.LEVELS.bot, lib.LEVELS.borken)
#borken
	map.add_edge(lib.DIR.up, lib.LEVELS.borken, lib.LEVELS.bot)
	map.add_edge(lib.DIR.down, lib.LEVELS.borken, lib.LEVELS.feel_alive)
#feel_alive
	map.add_edge(lib.DIR.up, lib.LEVELS.feel_alive, lib.LEVELS.borken)
	map.add_edge(lib.DIR.down, lib.LEVELS.feel_alive, lib.LEVELS.pogchamp)
#pogchamp
	map.add_edge(lib.DIR.up, lib.LEVELS.pogchamp, lib.LEVELS.feel_alive)
	map.add_edge(lib.DIR.left, lib.LEVELS.pogchamp, lib.LEVELS.cog_3)

#cars

#scrapmobile
	map.add_edge(lib.DIR.right, lib.LEVELS.scrapmobile, lib.LEVELS.hub)
	map.add_edge(lib.DIR.up, lib.LEVELS.scrapmobile, lib.LEVELS.speaker)
#speaker
	map.add_edge(lib.DIR.up, lib.LEVELS.speaker, lib.LEVELS.succ)
	map.add_edge(lib.DIR.down, lib.LEVELS.speaker, lib.LEVELS.scrapmobile)
#succ
	map.add_edge(lib.DIR.left, lib.LEVELS.succ, lib.LEVELS.whistling_jackhammer)
	map.add_edge(lib.DIR.down, lib.LEVELS.succ, lib.LEVELS.speaker)
#whistling_jackhammer
	map.add_edge(lib.DIR.up, lib.LEVELS.whistling_jackhammer, lib.LEVELS.succor)
	map.add_edge(lib.DIR.right, lib.LEVELS.whistling_jackhammer, lib.LEVELS.succ)
#succor
	map.add_edge(lib.DIR.down, lib.LEVELS.succor, lib.LEVELS.whistling_jackhammer)
	map.add_edge(lib.DIR.right, lib.LEVELS.succor, lib.LEVELS.why)
#why
	map.add_edge(lib.DIR.left, lib.LEVELS.why, lib.LEVELS.succor)
	map.add_edge(lib.DIR.up, lib.LEVELS.why, lib.LEVELS.gardener)
#gardener
	map.add_edge(lib.DIR.down, lib.LEVELS.gardener, lib.LEVELS.why)
	map.add_edge(lib.DIR.right, lib.LEVELS.gardener, lib.LEVELS.walls)

#sinkhole

#dirk
	map.add_edge(lib.DIR.up, lib.LEVELS.dirk, lib.LEVELS.sink)
	map.add_edge(lib.DIR.down, lib.LEVELS.dirk, lib.LEVELS.succ_2)
#sink
	map.add_edge(lib.DIR.down, lib.LEVELS.sink, lib.LEVELS.dirk)

#construction

#minecraft_construction_area
	map.add_edge(lib.DIR.down, lib.LEVELS.minecraft_construction_area, lib.LEVELS.infinity)
#infinity
	map.add_edge(lib.DIR.up, lib.LEVELS.infinity, lib.LEVELS.minecraft_construction_area)
	map.add_edge(lib.DIR.down, lib.LEVELS.infinity, lib.LEVELS.reck)
#reck
	map.add_edge(lib.DIR.up, lib.LEVELS.reck, lib.LEVELS.infinity)
	map.add_edge(lib.DIR.right, lib.LEVELS.reck, lib.LEVELS.placeholder)
	map.add_edge(lib.DIR.down, lib.LEVELS.reck, lib.LEVELS.ralph)
#placeholder
	map.add_edge(lib.DIR.left, lib.LEVELS.placeholder, lib.LEVELS.reck)
	map.add_edge(lib.DIR.down, lib.LEVELS.placeholder, lib.LEVELS.garbage)
	map.add_edge(lib.DIR.up, lib.LEVELS.placeholder, lib.LEVELS.magneto)
#garbage
	map.add_edge(lib.DIR.up, lib.LEVELS.garbage, lib.LEVELS.placeholder)
#magneto
	map.add_edge(lib.DIR.down, lib.LEVELS.magneto, lib.LEVELS.placeholder)
	map.add_edge(lib.DIR.right, lib.LEVELS.magneto, lib.LEVELS.gemeni)
	map.add_edge(lib.DIR.up, lib.LEVELS.magneto, lib.LEVELS.mixer)
#mixer
	map.add_edge(lib.DIR.down, lib.LEVELS.mixer, lib.LEVELS.magneto)
#gemeni
	map.add_edge(lib.DIR.left, lib.LEVELS.gemeni, lib.LEVELS.magneto)
#ralph
	map.add_edge(lib.DIR.up, lib.LEVELS.ralph, lib.LEVELS.reck)
	map.add_edge(lib.DIR.left, lib.LEVELS.ralph, lib.LEVELS.welding)
#welding
	map.add_edge(lib.DIR.left, lib.LEVELS.welding, lib.LEVELS.byeah)
	map.add_edge(lib.DIR.right, lib.LEVELS.welding, lib.LEVELS.reck)
#byeah
	map.add_edge(lib.DIR.right, lib.LEVELS.byeah, lib.LEVELS.welding)
	map.add_edge(lib.DIR.left, lib.LEVELS.byeah, lib.LEVELS.con)

#incinerator

#warm
	map.add_edge(lib.DIR.left, lib.LEVELS.warm, lib.LEVELS.backwards)
	map.add_edge(lib.DIR.up, lib.LEVELS.warm, lib.LEVELS.conveyor)
	map.add_edge(lib.DIR.right, lib.LEVELS.warm, lib.LEVELS.succ_3)
#succ_3
	map.add_edge(lib.DIR.left, lib.LEVELS.succ_3, lib.LEVELS.warm)
	map.add_edge(lib.DIR.right, lib.LEVELS.succ_3, lib.LEVELS.incins_big_win)
#incins_big_win
	map.add_edge(lib.DIR.left, lib.LEVELS.incins_big_win, lib.LEVELS.succ_3)
	map.add_edge(lib.DIR.down, lib.LEVELS.incins_big_win, lib.LEVELS.incin_1)
#incin_1
	map.add_edge(lib.DIR.down, lib.LEVELS.incin_1, lib.LEVELS.incin_4)
	map.add_edge(lib.DIR.left, lib.LEVELS.incin_1, lib.LEVELS.incin_2)
	map.add_edge(lib.DIR.up, lib.LEVELS.incin_1, lib.LEVELS.incins_big_win)
#incin_2
	map.add_edge(lib.DIR.down, lib.LEVELS.incin_2, lib.LEVELS.incin_3)
	map.add_edge(lib.DIR.left, lib.LEVELS.incin_2, lib.LEVELS.papier)
	map.add_edge(lib.DIR.right, lib.LEVELS.incin_2, lib.LEVELS.incin_1)
#incin_3
	map.add_edge(lib.DIR.down, lib.LEVELS.incin_3, lib.LEVELS.alternia)
	map.add_edge(lib.DIR.up, lib.LEVELS.incin_3, lib.LEVELS.incin_2)
#incin_4
	map.add_edge(lib.DIR.up, lib.LEVELS.incin_4, lib.LEVELS.incin_1)
#papier
	map.add_edge(lib.DIR.right, lib.LEVELS.papier, lib.LEVELS.incin_2)
#alternia
	map.add_edge(lib.DIR.up, lib.LEVELS.alternia, lib.LEVELS.incin_3)
	
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
	connect_obj(level)
	level.connect("door_entered", self, "on_level_door_entered")
	
	$Characters.connect("character_clicked", self, "on_character_clicked")
	$UI/UI.connect("continue_dialog_pressed", self, "on_continue_dialog_pressed")
	$UI/UI.connect("tool_button_pressed", self, "on_tool_button_pressed")
	
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
	connect_obj(level)
	$Characters.move_characters(level_name)


func connect_obj(level):
	var objs = level.get_children()
	for o in objs:
		if o.has_meta("obj"):
			o.connect("obj_clicked", self, "on_obj_clicked")

func on_obj_clicked(obj_type, l_r, obj):
	match obj_type:
		lib.OBJ.test_obj:
			if l_r == lib.LEFT:
				print("Left Cliked: " + "Test Obj " + "With: " + $Player.selected_tool as String)
			if l_r == lib.RIGHT:
				print("Right Cliked: " + "Test Obj " + "With: " + $Player.selected_tool as String)
		lib.OBJ.glue:
			if l_r == lib.LEFT:
				print("Left Cliked: " + "Glue " + "With: " + $Player.selected_tool as String)
				$UI/UI/Inventory/Panel/VBox/Tool1.visible = true
			if l_r == lib.RIGHT:
				print("Right Cliked: " + "Glue " + "With: " + $Player.selected_tool as String)
		lib.OBJ.wood:
			if l_r == lib.LEFT:
				print("Left Cliked: " + "Glue " + "With: " + $Player.selected_tool as String)
				$UI/UI/Inventory/Panel/VBox/Item1.visible = true
			if l_r == lib.RIGHT:
				print("Right Cliked: " + "Glue " + "With: " + $Player.selected_tool as String)
		lib.OBJ.pit:
			if l_r == lib.LEFT:
				print("Left Cliked: " + "Glue " + "With: " + $Player.selected_tool as String)
				if $Player.selected_tool == lib.ITEMS.wood:
					obj.get_node("CollisionShape2D").disabled = true
					obj.get_node("AnimatedSprite").play("fixed")
					print(obj.get_node("CollisionShape2D").disabled)
			if l_r == lib.RIGHT:
				print("Right Cliked: " + "Glue " + "With: " + $Player.selected_tool as String)

func on_tool_button_pressed(tool_type):
	$Player.selected_tool = tool_type

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

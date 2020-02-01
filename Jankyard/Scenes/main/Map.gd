tool

extends Node2D

signal level_change

const lib = preload("res://lib.gd")

var map: lib.Graph = lib.Graph.new()

var level_name = "level_1"
var level

var player_postions: Dictionary = {
		lib.DIR.up: Vector2(512, 30),
		lib.DIR.right: Vector2(994, 300),
		lib.DIR.down: Vector2(512, 570),
		lib.DIR.left: Vector2(30, 300),
		}

func _ready():
	# setting up map
	map.add_vertex("level_1", {"path": "res://Scenes/level/levels/level_1.tscn"}) # (0,0)
	map.add_vertex("level_2", {"path": "res://Scenes/level/levels/level_2.tscn"}) # (0,1)
	map.add_vertex("level_3", {"path": "res://Scenes/level/levels/level_3.tscn"}) # (1,0)
	map.add_vertex("level_4", {"path": "res://Scenes/level/levels/level_4.tscn"}) # (0,-1)
	map.add_vertex("level_5", {"path": "res://Scenes/level/levels/level_5.tscn"}) # (-1, 0)
	map.add_vertex("level_6", {"path": "res://Scenes/level/levels/level_6.tscn"}) # (1,1)
	map.add_vertex("level_7", {"path": "res://Scenes/level/levels/level_7.tscn"}) # 3
	map.add_vertex("level_8", {"path": "res://Scenes/level/levels/level_8.tscn"}) # 1
	map.add_vertex("level_9", {"path": "res://Scenes/level/levels/level_9.tscn"}) # 7
	
	map.add_edge(lib.DIR.up, "level_1", "level_2")
	map.add_edge(lib.DIR.right, "level_1", "level_3")
	map.add_edge(lib.DIR.down, "level_1", "level_4")
	map.add_edge(lib.DIR.left, "level_1", "level_5")
	
	# settign up level
	var level = load(map.vertices[level_name].data["path"]).instance()
	add_child(level)
	level.connect("door_entered", self, "on_level_door_entered")
	
	print("ready")

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

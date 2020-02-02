enum DIR{up, right, down, left}

enum CHARACTERS{test_character, broken_robot_1, broken_robot_2, broken_robot_3, _3v_1l}

const DATA: Dictionary = {
	"dialog": {
		CHARACTERS.test_character: {
			0: ["dont click me", "go away"],
		},
		CHARACTERS.broken_robot_1: {
			0: ["(sad robot noises)"],
		},
		CHARACTERS.broken_robot_2: {
			0: ["(dying robot noises)"],
		},
		CHARACTERS.broken_robot_3: {
			0: ["Zrrt"],
		},
	},
	"dialog_counter": {
		CHARACTERS.test_character: {
			"line": 0,
			"level": 0,
		},
		CHARACTERS.broken_robot_1: {
			"line": 0,
			"level": 0,
		},
		CHARACTERS.broken_robot_2: {
			"line": 0,
			"level": 0,
		},
		CHARACTERS.broken_robot_3: {
			"line": 0,
			"level": 0,
		},
	},
}

class Graph:
	var vertices: Dictionary
	
	func _init():
		pass
	
	func add_vertex(id, data: Dictionary): 
		var new_vertex = Vertex.new(id, data)
		vertices[id] = new_vertex
	
	func add_edge(dir, from, to):
		vertices[from].add_connection(dir, to)
		vertices[to].add_connection(RDIR(dir), from)
	
	func RDIR(dir):
		match dir:
			DIR.up:
				return DIR.down
			DIR.right:
				return DIR.left
			DIR.down:
				return DIR.up
			DIR.left:
				return DIR.right
	
	class Vertex:
		var data: Dictionary
		
		var id
		var connections: Dictionary = {}
		
		func _init(id, data: Dictionary):
			self.id = id
			self.data = data
			
			data["door_data"] = {
					DIR.up: false,
					DIR.right: false,
					DIR.down: false,
					DIR.left: false,
					}
	
		func add_connection(dir, id):
			connections[dir] = id
			data["door_data"][dir] = true

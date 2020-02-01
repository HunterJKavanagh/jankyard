enum DIR{up, right, down, left}

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

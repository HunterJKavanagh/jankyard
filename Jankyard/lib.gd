enum DIR{up, right, down, left}

enum CHARACTERS{test_character, broken_robot_1, broken_robot_2, broken_robot_3, _3V_1L, B3_4T, F3_3L, R3_CK, _5U_CC}

enum OBJ{test_obj, glue}

enum TOOLS{hands, glue, tool2, tool3, tool4, tool5, tool6}

const LEFT = 0
const RIGHT = 1

enum LEVELS {level_1, level_2, level_3, level_4, level_5, level_6, level_7, level_8, level_9, hub, first_bridge, first_ramp, conveyor, walkie, cog_1, cog_2, cog_3, cog_4, plant, con, garbo, planto, saw, stakes, tree, stake_2, walls, succ_2, orotto, stake_3, roboto, bot, borken, feel_alive, pogchamp, scrapmobile, speaker, succ, whistling_jackhammer, succor, why, gardener, dirk, sink, minecraft_construction_area, infinity, reck, placeholder, garbage, magneto, mixer, gemeni, ralph, welding, byeah, warm, backwards, succ_3, incins_big_win, incin_1, incin_2, incin_3, incin_4, alternia, papier}

const DIALOG: Dictionary = {
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
	CHARACTERS._3V_1L: {
		0: ["Hey you, you were trying to cross the border right? Walked right into that human ambush", "*move with WASD*", "You’re currently in the Jankyard. Don’t you remember?", "Oh, seems like you don’t remember much. Damn humans must have wiped your internal files. I guess that’s lucky though, most of us scrapped bots end up stuck or broken.", "Hey, that means you can escape!", "Go on. Get!"],
		1: ["Oh hey! You found my nephew. Never liked that little brat, but you can still talk to me through him if you need my help or if you just want to receive my wonderful audio."],
		2: ["AAAAAH TOO MUCH BASS"],
		3: ["GIVE THE SPEAKER TO B3-4T, PLEASE!"],
		4: ["This is a somewhat more tolerable situation"],
	},
	CHARACTERS.B3_4T: {
		0: ["Yeeeaah, let’s move it people!"],
		1: ["Yoyoyoyo! That’s sick!"],
		2: ["WOO YEAH, FEEL THE BEAT!"],
	},
	CHARACTERS.F3_3L: {
		0: ["How are your relations with your creators? (y/n)", "How was your childhood? Do you think you were a normal child? (y/n)", "Are you sexually active? (y/n)", "What do you see in this image? (y/n)", "Can you handle the truth? (y/n)", "Are you able to use these pliers? (y/n)", "Diagnosis - Sexual Deviant"],
		1: ["How does this beat make you feel?"],
	},
	CHARACTERS.R3_CK: {
		0: ["AAyyyyyyyy! I’m wrecking here!"],
		1: ["Ay tanks, now Im finna wreck da junk"],
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

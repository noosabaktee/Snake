extends TextureRect

var x
var y

func _ready():
	randomize() 
	x = int(rand_range(0, 19))
	y = int(rand_range(0, 19))
	self.set_position(Vector2(x*30,y*30))

func move():
	randomize() 
	x = int(rand_range(0, 19))
	y = int(rand_range(0, 19))
	self.set_position(Vector2(x*30,y*30))

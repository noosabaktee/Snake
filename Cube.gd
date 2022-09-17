extends ColorRect

var cubeColor = Color( 0, 0, 1, 1 )
var width = 30
var height = 30
export var x = 0
export var y = 0
var speed = 0.3
var direction = "right"
var move = true

var _timer

func _init():
	self.rect_position = Vector2(x,y)
	self.color = cubeColor
	self.set_size(Vector2(width,height))

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "update_game")
	_timer.set_wait_time(speed)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	

func update_game():
	move = true
	if direction == "right":
		x += 1
	elif direction == "left":
		x -= 1
	elif direction == "up":
		y -= 1
	elif direction == "down":
		y += 1
		
	if x > 19:
		x = 0
	elif x < 0:
		x = 19
	elif y > 19:
		y = 0
	elif y < 0:
		y = 19
		
	self.set_position(Vector2(x*30,y*30))

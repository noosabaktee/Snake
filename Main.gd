extends Node2D

var window = Vector2(ProjectSettings.get_setting("display/window/size/width"),ProjectSettings.get_setting("display/window/size/height"))

#Line variable
var lineLength = 20
var lineColor =  Color( 0, 0, 0, 1 )
#Get distance each line
var distance = floor(window.x/lineLength)

var head 
var meal
var sumOfBody
var body = []
var turn = {Vector2(0,0):"right"}

func _ready():
	meal = get_node("Meal")
	head = get_node("Body").get_child(0)
	sumOfBody = get_node("Body").get_child_count() - 1
	for i in sumOfBody:
		body.append(get_node("Body").get_child(i+1))
	
func _physics_process(delta):
	if head.move == true:
		if Input.is_action_just_pressed("ui_right") and head.direction != "left":
			head.direction = "right"
			turn[Vector2(head.x,head.y)] = head.direction
			head.move = false
		elif Input.is_action_just_pressed("ui_left") and head.direction != "right":
			head.direction = "left"
			turn[Vector2(head.x,head.y)] = head.direction
			head.move = false
		elif Input.is_action_just_pressed("ui_up") and head.direction != "down":
			head.direction = "up"
			turn[Vector2(head.x,head.y)] = head.direction
			head.move = false
		elif Input.is_action_just_pressed("ui_down") and head.direction != "up":
			head.direction = "down"
			turn[Vector2(head.x,head.y)] = head.direction
			head.move = false
			
	for b in len(body):
		var pos = Vector2(body[b].x,body[b].y)
		if pos in turn:
			body[b].direction = turn[pos]
			if b == len(body)-1:
				turn.erase(pos)
	
	if head.rect_position == meal.rect_position:
		meal.move()

func _draw():
#	Draw grid
	for i in lineLength:
		draw_line(Vector2(distance * i,0), Vector2(distance * i,window.y),lineColor)
		draw_line(Vector2(0,distance * i), Vector2(window.x,distance * i),lineColor)



extends "res://Scripts/State Machine/state.gd"

func enter():
	pass


func handle_input(event):
	return event


func update(delta):
	if owner.direction.x == 0:
		emit_signal("finished","Died");
		return
	move(owner.speed, owner.direction, delta);
	

func move(speed, direction,delta):
	owner.velocity.x = direction.x * speed
	owner.move_and_slide(owner.velocity, Vector2(0,-1))
	return delta
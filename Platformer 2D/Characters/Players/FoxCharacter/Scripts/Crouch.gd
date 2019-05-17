extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("Anim").play("Crouch")
	owner.get_node("col").rotation_degrees = 90;
	owner.get_node("col").global_position.y += 4;

func handle_input(event):
	if Input.is_action_just_pressed("ui_up"):
		emit_signal("finished","Jump");
		owner.get_node("col").rotation_degrees = 0;
		owner.get_node("col").global_position.y -= 4;
	
	return event

func update(delta):
	if owner.direction.x != 0:
		move(owner.speed/2, owner.direction);
	else:
		move(0,Vector2(0,0))
	return delta

func move(speed, direction):
	owner.velocity.x = direction.x * speed
	owner.move_and_slide(owner.velocity, Vector2(0,-1))
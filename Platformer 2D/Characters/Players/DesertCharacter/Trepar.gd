extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("Anim").play("Trepar")
	owner.get_node("BodyPivot/Images").frame = 1


func handle_input(event):
	pass;
	return event;

func update(delta):
	if Input.is_action_pressed("ui_down"):
		emit_signal("finished","Idle");
		owner.set_physics_process(true);
	
	if owner.direction.x == 0:
		owner.get_node("BodyPivot/Images").frame = 0;

	move(owner.speed, owner.direction, delta);

func move(speed, direction,delta):
	owner.velocity.x = direction.x * speed
	owner.move_and_slide(owner.velocity, Vector2(0,-1))
	return delta
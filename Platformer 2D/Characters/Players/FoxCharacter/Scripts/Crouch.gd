extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("Anim").play("Crouch")

func handle_input(event):
	if event == null:
		emit_signal("finished","Idle");
	return event

func update(delta):
	if owner.direction.x != 0:
		emit_signal("finished","Move")
	return delta
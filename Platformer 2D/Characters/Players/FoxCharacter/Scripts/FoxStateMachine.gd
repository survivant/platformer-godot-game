extends "res://Scripts/State Machine/state_machine.gd"

func _ready():
	states_map = {"Idle":$Idle, "Move": $Move, "Crouch": $Crouch, "Jump": $Jump};
	.set_active(true);
	change_state("Idle");

func change_state(new_state):
	.change_state(new_state);
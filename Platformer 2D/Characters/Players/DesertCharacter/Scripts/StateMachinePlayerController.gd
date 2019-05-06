extends "res://Scripts/State Machine/state_machine.gd"

func _ready():
	states_map = {"Idle": $Idle, "Move": $Move, "Jump": $Jump, 
			"Attack": $Attack, "Died":$Died, "Trepar": $Trepar,
			"Damage": $Damage};
	.set_active(true);
	change_state("Idle");

func change_state(state_name):
	.change_state(state_name);
extends KinematicBody2D

#warning-ignore:unused_signal
signal finished

var velocity = Vector2()
var distance = Vector2()
var speed = 26.50
var gravity = 450
var jump_speed = 150
var direction = Vector2(1,0)
var d

func _ready():
	distance = Vector2(0,0)
	speed = 26.50
	gravity = 450
	jump_speed = 150

func _physics_process(delta):
	_apply_gravity(true,delta);

func _input(event):
	return event;

func _apply_gravity(value,delta):
	if value:
		velocity.y += gravity*delta
		var move_info = move_and_slide(velocity,Vector2(0,-1))
		
		if direction.x == 1:
			d = transform;
			d[2].x += 5;
		elif direction.x == -1:
			d = transform;
			d[2].x -= 5;
		
		if !test_move(d,Vector2(5,2)):
			direction.x = -1;
			$icon.flip_h = true;
		elif !test_move(d,Vector2(-5,2)):
			direction.x = 1;
			$icon.flip_h = false;
		
		if is_on_wall():
			if direction.x == -1:
				direction.x = 1;
				$icon.flip_h = false;
			else:
				direction.x = -1;
				$icon.flip_h = true;
		
		if is_on_floor():
			velocity.y = 0;
		return move_info;
	else:
		return;

func _damage():
	direction.x = 0
	get_node("AnimationPlayer").play("Died");

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Died":
		queue_free();

func _on_AreaCollision_body_entered(body):
	if body.is_in_group("Characters"):
		body.emit_signal("finished","Damage");

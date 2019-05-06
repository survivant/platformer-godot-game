extends "res://Scripts/Inventory/Item.gd"

export var coin_texture : Texture;
var self_path = "res://Items/Coin/Coin.tscn";

func _ready():
	itemCant = 1;
	itemName = "Coin"
	$spr.texture = coin_texture;
	itemImage = $spr_icon.texture;
	$anim.play("mov");

func _on_area_col_body_entered(body):
	if body.is_in_group("Characters"):
		$particles.emitting = true
		if $anim.is_playing():
			$anim.stop()
			$anim.play("delete")
			owner.get_node("CanvasLayer/Inventory").generate_item(self_path);

func _on_anim_animation_finished(anim_name):
	if anim_name == "delete":
		queue_free()

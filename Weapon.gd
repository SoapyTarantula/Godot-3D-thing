extends Spatial
#export(PackedScene) var Bullet

var muzzle_velocity = 20

func _ready():
	pass
	
func _on_Player_shoot_attempt():
	var Bullet = load("res://Projectile.tscn")
	var b = Bullet.instance()
	b.transform.origin = $SMG/Muzzle.transform.origin

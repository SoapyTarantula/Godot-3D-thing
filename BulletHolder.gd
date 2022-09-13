extends Node

onready var player = get_node("/root/Main/Player")

func _ready():
	player.connect("shoot_attempt", self, "_on_Player_shoot_attempt") # Have this script listen for the shooting signal from the player

func _on_Player_shoot_attempt():
	var bullet = load("res://Projectile.tscn")
	var b = bullet.instance()
	var bh = get_node("/root/Main/BulletHolder") # SOLVED - godot wants you to say /root/Main/etc even though it knows what root/Main is, wtf
	bh.add_child(b, true)
	#b.transform.origin = player.get_node("Camera/WeaponHolder/SMG/Muzzle").transform.origin # Figure out some way of getting the bullet to the actual muzzle of the gun that doesn't throw a fucking error

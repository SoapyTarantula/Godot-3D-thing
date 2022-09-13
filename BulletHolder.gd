extends Node

onready var player = get_node("/root/Main/Player")

func _ready():
	pass


func _on_Player_shoot_attempt():
	var bullet = load("res://Projectile.tscn")
	var b = bullet.instance()
	var bh = get_node("/root/Main/BulletHolder") # SOLVED - godot wants you to say /root/Main/etc even though it knows what root/Main is, wtf
	bh.add_child(b, true)
	print(str(bh) + " | " + str(b))

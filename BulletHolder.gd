extends Node

onready var player = get_node("/root/Main/Player")

func _ready():
	print(player)


func _on_Player_shoot_attempt():
	var bullet = load("res://Projectile.tscn")
	var b = bullet.instance()
	var bh = get_node("BulletHolder") # figure out why the fuck this is null all the time regardless of path
	bh.add_child(b, true)

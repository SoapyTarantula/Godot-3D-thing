extends RigidBody
signal hit_something

var proj_vel = 20

var velocity = Vector3.ZERO

func _physics_process(delta):
	velocity = velocity * proj_vel * delta

func _on_Projectile_body_entered(_body):
	emit_signal("hit_something", transform.origin)
	queue_free()

#Despawn the projectile after a timer to prevent infinite bullet madness
func _on_DespawnTimer_timeout():
	queue_free()

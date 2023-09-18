extends Area2D

var direction: Vector2 = Vector2.UP;
var speed : float = 300;

func _process(delta):
	position += direction * speed * delta;
	

func on_exited():
	queue_free(); # Replace with function body.

func _on_body_entered(body):
	body.queue_free();

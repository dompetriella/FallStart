extends CharacterBody2D

var speed : float = 25;
var direction : Vector2 = Vector2.DOWN;

func _ready():
	velocity = direction * speed;

func _physics_process(delta):
	move_and_slide();

extends CharacterBody2D

@export var bullet_node : PackedScene;
@onready var fire_rate = $FireRate;
@onready var cooldown = $Cooldown;
@onready var active = $Active

func _physics_process(_delta):
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized() * 150;
	move_and_slide();

func _ready():
	active.start();
	fire_rate.start();

var canShoot: bool = true;
		
func _on_active_timeout():
	weaponCoolingOff();

func _on_cooldown_timeout():
	turnOnWeapon();

func turnOnWeapon():
	canShoot = true;
	active.start();
	fire_rate.start();
	
func weaponCoolingOff():
	canShoot = false;
	cooldown.start();
	fire_rate.stop();

func _shoot():
	var bullet = bullet_node.instantiate();
	bullet.position = position;
	get_tree().current_scene.add_child(bullet);

func _on_fire_rate_timeout():
	if (canShoot):
		_shoot();

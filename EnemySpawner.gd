extends Node2D

@onready var wave_timer = $WaveTimer;
@export var enemy_node: PackedScene;

var wave: int = 1;

func _ready():
	randomize();
	spawn();

func _on_wave_timer_timeout():
	wave += 1;
	spawn();

func spawn():
	var enemy = enemy_node.instantiate();
	
	enemy.position = Vector2(randf_range(20,100), -8);
	enemy.speed = wave * 2.5;
	enemy.tree_exited.connect(spawn);
	
	call_deferred("add_child", enemy);

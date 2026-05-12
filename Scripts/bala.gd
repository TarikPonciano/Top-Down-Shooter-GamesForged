extends Area2D

var velocidade = 300
var direcao = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += velocidade * direcao * delta
	
	

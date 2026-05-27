extends Area2D

var velocidade = 300
var direcao = Vector2.ZERO
@export var dano := 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += velocidade * direcao * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	#Destruir a bala quando ela colidir com o inimigo
	if body.is_in_group("Inimigos"):
		body.tomar_dano(dano)
		self.queue_free()


func _on_timer_timeout() -> void:
	self.queue_free()

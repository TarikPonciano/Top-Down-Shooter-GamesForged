extends CharacterBody2D

var SPEED = 300.0
var direcao = Vector2.ZERO

@export var jogador: CharacterBody2D

func _physics_process(delta: float) -> void:
	#TENTAR FAZER O ZUMBI OLHAR PARA O JOGADOR
	mover()
	rotacionar_corpo()
	
	move_and_slide()

func mover():
	if jogador:
		direcao = (jogador.global_position - global_position).normalized()
		
		velocity = direcao * SPEED
	
func rotacionar_corpo():
	if jogador:
		look_at(jogador.global_position)

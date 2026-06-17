extends CharacterBody2D

var SPEED = 300.0
var direcao = Vector2.ZERO
@export var vida := 10

@export var jogador: CharacterBody2D
@export var dinheiro_cena : PackedScene

@onready var barra_de_vida := $BarraDeVida

func _ready() -> void:
	# 1 é a base, 0.1 * (Global.round - 1) aumenta a dificuldade em 10% para cada round passado
	vida = vida * (1 + (0.1 * (Global.round-1)))
	
	barra_de_vida.max_value = vida
	barra_de_vida.value = vida

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

func tomar_dano(dano_recebido):
	vida -= dano_recebido
	barra_de_vida.value = vida
	if vida <= 0:
		derrubar_dinheiro()
		self.queue_free()

func derrubar_dinheiro():
	var novo_dinheiro = dinheiro_cena.instantiate()
	
	novo_dinheiro.global_position = global_position
	
	get_tree().current_scene.add_child(novo_dinheiro)

func _on_area_ataque_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players"):
		body.tomar_dano()

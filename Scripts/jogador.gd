extends CharacterBody2D

const SPEED = 300.0
var direcao = Vector2.ZERO

@onready var ponta_arma = $PontaDaArma

@export var bala_cena: PackedScene

func _physics_process(delta: float) -> void:
	
	mover()
	rotacionar_corpo()
	
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		disparar()
		
func disparar():
	
	#1. Criar a bala
	var nova_bala = bala_cena.instantiate()
	
	#2. Configurar a bala (Posição Inicial e Direção)
	nova_bala.global_position = ponta_arma.global_position
	nova_bala.direcao = (ponta_arma.global_position - global_position).normalized()
	
	#3. Adicionar a bala na fase
	get_tree().current_scene.add_child(nova_bala)

func mover():
	
	direcao = Input.get_vector("andar_esquerda", "andar_direita", "andar_cima", "andar_baixo")
	velocity = direcao * SPEED
	
func rotacionar_corpo():
	look_at(get_global_mouse_position())
	
	
	
	
	

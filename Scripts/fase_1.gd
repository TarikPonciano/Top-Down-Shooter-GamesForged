extends Node2D

@onready var pontos_spawn = $SpawnPoints
@onready var jogador = $Jogador

var cena_inimigo = preload("res://Scenes/inimigo.tscn")

func spawn_simples():
	# Pega o nó SpawnPoints, seleciona todos os nós dentro dele e por fim escolhe um aleatório
	var spawn_escolhido = pontos_spawn.get_children().pick_random()
	
	#1. Criar o inimigo
	var novo_inimigo = cena_inimigo.instantiate()
	
	#2. Configurar o inimigo
	novo_inimigo.global_position = spawn_escolhido.global_position
	
	novo_inimigo.jogador = jogador
	
	#3. Spawnar inimigo na fase
	get_tree().current_scene.add_child(novo_inimigo)

func _on_spawn_timer_timeout() -> void:
	spawn_simples()

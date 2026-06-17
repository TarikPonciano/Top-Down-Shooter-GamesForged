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

func spawn_avancado():
	var distancia_minima = 200
	var distancia_maxima = 500
	
	var novo_inimigo = cena_inimigo.instantiate()
	
	#Lógica de Spawn Complexa
	while true:
		var pos_x = randi_range(-distancia_maxima, distancia_maxima)
		var pos_y = randi_range(-distancia_maxima, distancia_maxima)
		
		var pos_final = Vector2(pos_x, pos_y)
		
		if pos_final.distance_to(Vector2.ZERO) >= distancia_minima and pos_final.distance_to(Vector2.ZERO) <= distancia_maxima:
			novo_inimigo.global_position = global_position + pos_final
			break
			
	novo_inimigo.jogador = jogador
	
	get_tree().current_scene.add_child(novo_inimigo)
			
	

func _on_spawn_timer_timeout() -> void:
	spawn_simples()

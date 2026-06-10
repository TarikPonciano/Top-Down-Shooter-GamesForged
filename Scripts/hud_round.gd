extends CanvasLayer

var tempoMaximo = 10
var tempoPassado = 0
@onready var tempo_round = $"Tempo do Round"

@onready var round_atual = $"Round Atual"


func _ready() -> void:
	atualizar_relogio()
	atualizar_round()

func _on_cronometro_round_timeout() -> void:
	tempoPassado += 1
	atualizar_relogio()

func atualizar_relogio():
	var diferenca_tempo = tempoMaximo - tempoPassado
	
	var tempo_minutos = int(diferenca_tempo / 60)
	var tempo_segundos = diferenca_tempo % 60
	
	if tempo_minutos < 10:
		tempo_minutos = "0"+str(tempo_minutos)
	else:
		tempo_minutos = str(tempo_minutos)
		
	if tempo_segundos < 10:
		tempo_segundos = "0"+str(tempo_segundos)
	else:
		tempo_segundos = str(tempo_segundos)
	
	tempo_round.text = tempo_minutos+":"+tempo_segundos
	
	if diferenca_tempo <= 0:
		fim_do_round()
	
func atualizar_round():
	round_atual.text = "Round: "+str(Global.round)
	
	
func fim_do_round():
	Global.round += 1
	get_tree().reload_current_scene()

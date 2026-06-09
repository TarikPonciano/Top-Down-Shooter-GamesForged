extends CanvasLayer

var tempoMaximo = 120
var tempoPassado = 0
@onready var tempo_round = $"Tempo do Round"

func _on_cronometro_round_timeout() -> void:
	tempoPassado += 1
	var tempoExibir = tempoMaximo - tempoPassado
	
	tempo_round.text = str(tempoExibir)
	

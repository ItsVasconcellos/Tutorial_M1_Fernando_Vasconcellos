extends Node2D
#Variáveis de controle para saberem se o baú já foi aberto pelo menos uma vez
var bau1 = false
var bau2 = false
#Variáveis de controle para saber se está na área para abrir o baú
var bauCanShow1 = false
var bauCanShow2 = false


func _ready():
#	Esconde atributos os quais apareceram mais para frente do jogo.
	$Mago/Sprite.hide()
	$Mago/ColorRect.hide()
	$Mago/ColorRect/Label.hide()
	$Tentaculo/Bau/Sprite.hide()
	$TentaculoDois/Bau/Perna.hide()

func _process(delta):
	
#	Verifica se esta na posição do bau 1
	if $Mago.position.x <=(-446):
#	Deixa a variável de proximidade do baú verdadeira
		bauCanShow1 = true
#		Se o baú ainda não foi aberto
		if !bau1:
			#Aparece o sprite para apertar a tecla E
			$Mago/Sprite.show()
#			Caso seja apertado E, aparecerá um retângulo com a label mostrando que ele realizou a primeira tarefa.
			if(Input.is_action_pressed("ui_e")):
				$Tentaculo/Bau/Sprite.show()
				$Mago/ColorRect.show()
				$Mago/ColorRect/Label.show()
				$Mago/ColorRect/Label.text = "Você achou o primeiro tentáculo do GitHub, ache suas outras partes para invocá-lo e commitar!"
#				Deixa a variável de aberuta do baú como verdadeira 
				bau1 = true
#		Mostra após a abertura do báu que o player deve continuar em busca das outras partes do git 
		else: 
			$Mago/ColorRect.show()
			$Mago/ColorRect/Label.show()
	else:
#		Caso não esteja na área do baú, ele torna falsa a variável
		bauCanShow1 = false
#		Caso não esteja nem na área do bau um ou do bau 2
		if !bauCanShow1 or !bauCanShow2:
			$Mago/Sprite.hide()
			$Mago/ColorRect.hide()
			$Mago/ColorRect/Label.hide()
		
#Verifica se está na posição do baú 2		
	if ($Mago.position.x >= 5*16 and $Mago.position.y <= -260 and $Mago.position.x <= 9*16):
#		Deixa a variável de proximada do baú como verdadeira
		bauCanShow2 = true
#		Verifica se o baú já foi aberto
		if !bau2:
#			Mostra a imagem da tecla para o usuário pressionar
			$Mago/Sprite.show()
#			Caso pressione E
			if(Input.is_action_pressed("ui_e")):
#				Mostra a foto dos itens do baú e uma explicação para o jogador.
				$TentaculoDois/Bau/Perna.show()
				$Mago/ColorRect.show()
				$Mago/ColorRect/Label.show()
				$Mago/ColorRect/Label.text = "Você achou o segundo tentáculo do GitHub, ache suas outras partes para invocá-lo e commitar!"
#				Torna a variável de abertura da baú verdadeira
				bau2 = true
		else: 
			$Mago/ColorRect.show()
			$Mago/ColorRect/Label.show()
	else:
		#Caso não esteja na área do baú, ele torna falsa a variável
		bauCanShow2 = false
		#Caso não esteja nem na área do bau um ou do bau 2
		if !bauCanShow1 && !bauCanShow2:
			$Mago/Sprite.hide()
			$Mago/ColorRect.hide()
			$Mago/ColorRect/Label.hide()

#Verifica se os dois baús ja foram abertos e passa para a próxima cena
	if bau2 && bau1:
		$Mago/ColorRect.hide()
		$Mago/ColorRect/Label.hide()
		$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://Cenas/Nivel2.tscn")


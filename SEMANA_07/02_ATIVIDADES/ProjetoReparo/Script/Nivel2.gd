extends Node2D

var bau = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Mago/Sprite.hide()
	$Mago/ColorRect.hide()
	$Mago/ColorRect/Label.hide()
	$Tentaculo/Bau/Sprite.hide()
	
func _process(delta):
#		Verifica se esta na posição do bau 
	if $Mago.position.x <=(-210) && $Mago.position.y <= 70:
#		Se o baú ainda não foi aberto
		if !bau:
			#Aparece o sprite para apertar a tecla E
			$Mago/Sprite.show()
#			Caso seja apertado E, aparecerá um retângulo com a label mostrando que ele realizou a primeira tarefa.
			if(Input.is_action_pressed("ui_e")):
				$Tentaculo/Bau/Sprite.show()
				$Mago/ColorRect.show()
				$Mago/ColorRect/Label.show()
				$Mago/ColorRect/Label.text = "Você achou a cabeça do github e conseguiu invocou o todo poderoso GM!"
#				Deixa a variável de aberuta do baú como verdadeira 
				bau = true
				$Timer.start()
#		Mostra após a abertura do báu que o player deve continuar em busca das outras partes do git 
		else: 
			$Mago/ColorRect.show()
			$Mago/ColorRect/Label.show()
	else:
		$Mago/Sprite.hide()
		$Mago/ColorRect.hide()
		$Mago/ColorRect/Label.hide()

#Quando acabar o tempo leva a última tela 
func _on_Timer_timeout():
	get_tree().change_scene("res://Cenas/Fim.tscn")

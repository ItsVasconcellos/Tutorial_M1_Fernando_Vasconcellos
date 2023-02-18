extends Node2D

var listaPersonagens = ["Luke", "Leia" , "Han", "C3PO", "Darth Vader"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Exercício
func _on_Button1_pressed():
	if $LineEdit2.text.empty():
		$Label.text = "Escreva algo para aparecer!"
	else:
		var listaUsuario = []
		listaUsuario = $LineEdit2.text.split(" ")
		var texto = ""
		for n in listaUsuario:
			texto += n + "\n"
		$Label.text = texto



#Exercício 4 -> Crie uma função que insira um valor digitado pelo usuário
func _on_Button2_pressed():
	if $LineEdit3.text.empty():
		$Label2.text = "Escreva algo para aparecer!"
	else:
		$Label2.text = $LineEdit3.text

#Exercício 1 -> Mostra uma lista já pronta na tela!
func _on_Button3_pressed():
	var texto = ""
	for n in listaPersonagens:
		texto += n + "\n"
	$Label3.text = texto
	
	
#Exercício 3 -> Crie uma função que retorne um texto na tela
func _on_Button4_pressed():
	$Label4.text = "Que a força esteja com você!"

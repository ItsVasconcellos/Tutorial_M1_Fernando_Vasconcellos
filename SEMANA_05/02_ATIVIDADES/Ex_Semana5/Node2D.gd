extends Node2D

var teste = false
var valor = 0
#Delcaração de variável não pode ser escrita com acento 
var numero = 0
#
var lista = []
#Criação de uma variável nova devido ao fato de ser chamada posteriormente no código 
var nome = ""

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	#Variável sendo declarada novamente apesar de já ter sido declarada além de 
	#ter sido declarada com acento
	#LineEdit faltando cifrão para identificar		
	numero = int($LineEdit.text)
	nome = $LineEdit.text.split(" ")[1]


func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		#Uso da variável nome com a letra maiuscúla		
		numero+=i
		#Mesmo erro da linha de cima		
		lista.append(numero)
	#Faltando a função str para permitir que a string seja convertida em número
	$Label.text = str(numero)


func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	#Declarando a variável fora do escopo do while, para que ela possa ser autoincrementada e usada como parametra do while	
	var i = 0
	while(i < len(lista)):
		#Adicionado a palavra var para cont, pois é a primeira vez que a variável é utilizada		
		var cont=0
		if(lista[i]%2==1):
			cont+=1
		if(cont!=0):
			nome = nome + " Baldo"
			$Label2.text = nome
			#Adicionando um break para que ele adicione baldo apenas uma única vez''''''''''''''''''
			break
		i+=1


extends KinematicBody2D
#Controla o quão rápido é o personagem
var velocidade = 5

func _ready():
	$Sprite.hide()

func _process(delta):
#	Verifica se há movimento
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
#		Chama a função para andar
		mover()
	else:
		$AnimatedSprite.play("default")

func mover():
	if Input.is_action_pressed("ui_right"):
#		Move o personagem na direção da direita de acordo com a variável velocidade
		move_and_slide(Vector2(50,0)*velocidade)
#		Toca a animação de correr
		$AnimatedSprite.play("running")
#		Inverte a animação caso esteja para a esquerda.
		$AnimatedSprite.flip_h = false
#	É aplicada a mesma lógica apenas invertendo o sentido.
	elif Input.is_action_pressed("ui_left"):
		move_and_slide(Vector2(-50,0)*velocidade)
		$AnimatedSprite.play("running")
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		move_and_slide(Vector2(0,-50)*velocidade)
		$AnimatedSprite.play("running")
	elif Input.is_action_pressed("ui_down"):
		move_and_slide(Vector2(0,50)*velocidade)
		$AnimatedSprite.play("running")


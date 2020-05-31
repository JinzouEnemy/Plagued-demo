extends Node2D

#zona de declaración de variables
onready var player = $player
onready var enemy = $enemy
onready var botones = $UI/buttonpanel/GridContainer

#función para controlar el turno del jugador, el yield
#espera hasta que el player emita la señal de turnend
func turnoplayer():
	if enemy != null:
		botones.show()
	player.acc = player.maxacc
	yield(player,"turnEnd")
	turnoenemigo()

#función de turno enemigo, para evitar que el player
#toque cosas que no debe se ocultan los botones, luego
#se llama a la func atacar del enemigo
func turnoenemigo():
	botones.hide()
	if enemy != null:
		enemy.atacar(player)
		turnoplayer()


func _on_enemy_muerto():
	botones.hide()
	enemy = null

func _ready():
	if player.vel > enemy.vel:
		turnoplayer()
	else:
		turnoenemigo()

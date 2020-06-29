extends Node2D

const battleunits = preload("res://BattleUnits.tres")

#zona de declaración de variables
onready var botones = $UI/buttonpanel/GridContainer

#función para controlar el turno del jugador, el yield
#espera hasta que el player emita la señal de turnend
func turnoplayer():
	var player = battleunits.player
	botones.show()
	player.acc = player.maxacc
	yield(player,"turnEnd")
	turnoenemigo()

#función de turno enemigo, para evitar que el player
#toque cosas que no debe se ocultan los botones, luego
#se llama a la func atacar del enemigo
func turnoenemigo():
	botones.hide()
	var enemy = battleunits.enemy
	if enemy != null:
		enemy.atacar()
		turnoplayer()


func _ready():
	var enemy = battleunits.enemy
	var player = battleunits.player
	if player.vel > enemy.vel:
		turnoplayer()
	else:
		turnoenemigo()

func _on_enemy_muerto():
	botones.hide()

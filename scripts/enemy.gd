extends Node2D


const battleunits = preload("res://BattleUnits.tres")
#zona de declaración de variables
onready var vidalabel = $vida
export(int) var hp = 30 setget setVida
var mp = 3
var vel = 2
export(int) var atk = 10
var def = 5
var mag = 10
#señales
signal turnEnd
signal muerto

#esta función maneja el calculo de vida del enemigo y
#la actualiza en la label de hp
func setVida(new_hp):
	hp = new_hp
	if vidalabel != null:
		vidalabel.text = str(hp) + "hp"
	 
func _ready():
	battleunits.enemy = self

func _exit_tree():
	battleunits.enemy = null


#función para manejar el daño infligido
func atacar():
	battleunits.player.hp -= atk
	emit_signal("turnEnd")


#función para chequear si está muerto
func morir():
	return hp <= 0


#función que se va a activar siempre que el usuario
#reciva daño, en caso de morir lo avisa con una señal
func recivoDamage(cantidad):
	self.hp -= cantidad - def/2
	if morir():
		battleunits.enemy = null
		emit_signal("muerto")
		queue_free()

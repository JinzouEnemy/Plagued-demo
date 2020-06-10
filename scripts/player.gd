extends Node2D

#le decimos al script que vamos a usar el resource
#battleunits
const battleunits = preload("res://BattleUnits.tres")

#zona de declaración de variables
var maxhp = 25
var hp = maxhp setget setHp
var maxacc = 1
var acc = maxacc setget setAcc
var mp = 10
var vel = 3
var def = 5
var atk = 4
var mag = 7
#zona de señales
signal turnEnd
signal hpChanged

#función setter de la variable hp
func setHp(cantidad):
	hp = min(cantidad,maxhp)
	emit_signal("hpChanged",cantidad)
func setAcc(cantidad):
	acc = min(cantidad,maxacc)
	if acc == 0:
		emit_signal("turnEnd")


#cuando el nodo entra en escena lo conectamos con nuestro
#scriptable object
func _ready():
	battleunits.player = self

#cuando el nodo sale de escena lo desconectamos
func _exit_tree():
	battleunits.player = null

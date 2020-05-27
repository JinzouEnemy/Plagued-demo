extends Node2D

#zona de declaración de variables
onready var vidalabel = $vida
var hp = 10 setget setVida
var mp = 3
var vel = 2
var atk = 6
var def = 5
var mag = 10
#señales
signal turnEnd
signal muerto

#esta función maneja el calculo de vida del enemigo y
#la actualiza en la label de hp
func setVida(new_hp):
	hp = new_hp
	vidalabel.text = str(hp) + "hp"

#función para manejar el daño infligido
func atacar(target):
	target.hp -= atk
	emit_signal("turnEnd")


#función para chequear si está muerto
func morir():
	return hp <= 0


#función que se va a activar siempre que el usuario
#reciva daño, en caso de morir lo avisa con una señal
func recivoDamage(cantidad):
	self.hp -= cantidad - def/2
	if morir():
		emit_signal("muerto")
		queue_free()

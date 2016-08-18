# Riña de Pescadores
### Proyecto Final del Curso Introductorio de la Academia {Hack}

Este programa fue desarrollado como proyecto final de **Curso Introductorio** para ingresar a la **6ta promoción** de la **Academia {Hack}**. El reto propuesto era implementar una versión reducida   del juego **Batalla   Naval**, llamada **Riña de Pescadores**.

## Descripción del juego

**Batalla Naval** es un popular juego de adivinación para dos jugadores   en el que cada uno debe tratar de hundir los barcos del oponente.   Consta de dos tableros cuadriculados por jugador: En el primer tablero, cada jugador posiciona secretamente sus barcos. Luego,  intercambiando turnos, cada jugador debe disparar a los barcos del oponente (adivinando sus   posiciones), esto   es, marcar un cuadro en su   segundo tablero tratando de impactar y  
hundir los barcos enemigos. Gana la partida el jugador que haya   hundido todos los barcos del enemigo.

## Reglas Generales del juego Riña de Pescadores

El   jugador   cuenta   con   dos   tableros   cuadriculados   de   10x10   casillas:   el   primero  
representa   la   zona   de   alta   mar   donde   el   pescador   ubicó   sus   peñeros.   El   segundo  
representa   la   zona   donde   los   peñeros   del   enemigo   (la   computadora)   se   encuentran  
ubicados   secretamente,   por   lo   que   es   en   este   tablero   donde   el   jugador   efectuará   sus  
ataques, intentando adivinar la ubicación de los peñeros enemigos.

Como reglas del juego Riña de Pescadores, se tienen las siguientes:

1. La   cantidad   de   barcos   que   tendrá   cada   jugador   debe   ser   solicitada   al   usuario   al  
iniciar   el   juego,   y   oscilará   entre   4   y   10   barcos.   Estos   barcos   deben   ser   ubicados   en  
el tablero por el usuario, indicando la coordenada de la posición para cada barco. 

2. El   juego   permitirá   al   usuario   jugar   contra   la   computadora.   Esto   es,   la   computadora  
ubicará sus peñeros y realizará sus ataques contra el jugador, aleatoriamente. 

3. Cada   peñero   ocupará   una   sola   casilla   del   tablero,   por   lo   que   cada   tiro   acertado  
implica el hundimiento del peñero impactado. 

4. El   programa   debe   indicar,   tanto   por   mensaje   como   visualmente   en   el   tablero  
correspondiente,   el   resultado   de   cada   turno   jugado,   permitiendo   saber   al   pescador   si  
acertó un ataque (hundiendo el peñero) o si el disparo cayó en alta mar (en el agua). 

5. Cada   vez   que   un   pescador   acierta   un   ataque,   podrá   efectuar   un   segundo   ataque  
consecutivo.  

6. No es posible jugar en una casilla en la que ya se ha realizado alguna jugada. 

7. El usuario siempre inicia la partida efectuando el primer ataque, por lo que si en su 
última jugada hunde el último barco de su oponente, esta tiene derecho a un último 
disparo que también le permita terminar de hundir la flota contraria, lo que supondría 
un empate. 

8. Gana el pescador que logre hundir todos los peñeros del oponente. 

## Construido con

* ruby 2.3.1

* Sublime Text 3


## Autor 

**Rafael Figueredo**


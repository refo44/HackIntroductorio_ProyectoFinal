# BatallaNaval.rb
 
 # Este programa fue desarrollado como proyecto final
 # del  Curso Introductorio de la  6ta promoción
 # de la  Academia {Hack} (ver archivo README.markdown)
 
 # autor: Rafael Figueredo
 
 def get_keypressed
# Lee la tecla pulsada desde el terminal sin presionar Enter
	
  system('stty raw -echo')
  t = STDIN.getc
  system('stty -raw echo')
	
  return t
end
 
def bienvenida_juego
# Este procedimiento
# Muestra la pantalla de bienvenida del juego
 	
  system('clear') 

  puts
  puts "RIÑA DE PESCADORES"
  puts
  puts "Presione cualquier tecla para iniciar (s para salir): "
  tecla = get_keypressed  

  system('clear') 

  if tecla.downcase == "s"  
    exit
  end

end

 def login_juego
 	# Este procedimiento
 	# solicita el nombre del jugador
 	
 	puts "RIÑA DE PESCADORES"
 	puts
 	print "Introduzca su nombre : "
 	jugador_name = gets.chomp 
 	puts
 end

def seleccion_num_barcos

  num_barcos = 10 # inicializado por defecto

  loop do
  
    system('clear')
    puts
     if num_barcos < 4 || num_barcos > 11
      puts "Debe escoger un numero entre 4 y 11"
      puts
     end
    
     print "  ¿Con cuantos barcos desea jugar?: "
     num_barcos = gets.chomp.to_i 
     puts
    
     break if num_barcos > 3 && num_barcos < 11
  end

end

def fill_tablero(s,n_length)

# Esta funcion retorna una matriz  NxN
# con el elemento s en todas sus entradas

  tablero = []

  for i in 0..n_length-1 do

    tablero[i] = []

    for j in 0..n_length-1 do

    tablero[i][j] = s 

    end

  end

  return tablero

end

def mostrar_tablero(m)

	print "  "

    for k in 0..m.length-1 do
      print "%2d" % k 
    end

    puts
    puts
   
    row_tags = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
  
  for i in 0..m.length-1 do
  
  	print "#{row_tags[i]} " 
  
    for j in 0..m.length-1 do
  
     print "%2s" % m[i][j]
  
    end
    print " "
    puts
  
  end

puts

end


def set_barcos
# Pregunta al jugador el numero barcos 
# que se utilizaran en la partida

  #seleccion_num_barcos
 

# incializamos el tablero de barcos
# 
 num_barcos = 10

barcos_jugador = fill_tablero("\u25A7",10)

mostrar_tablero(barcos_jugador)



end 


###############  main ###########################################

def main

  #bienvenida_process 
  #login_process
  set_barcos


end

main




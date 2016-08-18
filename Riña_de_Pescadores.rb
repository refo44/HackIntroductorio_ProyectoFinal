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

def anytecla
   puts "Presione cualquier tecla para continuar (s para salir del juego): "
  tecla = get_keypressed  

  system('clear') 

  if tecla.downcase == "s"  
    exit
  end
end

def titulo
 system('clear') 

  puts
  puts "RIÑA DE PESCADORES"
  put

end
 
def bienvenida_msj
# Este procedimiento
# Muestra la pantalla de bienvenida del juego
 	
 

end

def loading_partida

  system('clear')
  puts "RIÑA DE PESCADORES"
  puts "comenzando partida."
  sleep 0.4
  system('clear')
  puts "RIÑA DE PESCADORES"
  puts "comenzando partida.."
  sleep 0.4
  system('clear')
  puts "RIÑA DE PESCADORES"
  puts "comenzando partida..."
  puts
  sleep 0.4
  system('clear')
  puts "RIÑA DE PESCADORES"
  puts "comenzando partida...."
  sleep 0.4
  system('clear')

end

 def login_menu
 	# Este procedimiento
 	# solicita el nombre del jugador
 	
 	puts "RIÑA DE PESCADORES"
 	puts
 	print "Introduzca su nombre : "
 	jugador_name = gets.chomp 
 	puts
 end

def select_num_barcos

  num_barcos = 10 # inicializado por defecto

  loop do
  
    system('clear')
    puts
     if num_barcos < 4 || num_barcos > 10
      puts "Debe escoger un numero entre 4 y 10"
      puts
     end
    
     print "  ¿Con cuantos barcos desea jugar?: "
     num_barcos = gets.chomp.to_i 
     puts
    
     break if num_barcos > 3 && num_barcos < 11
  end

  return num_barcos

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

	row_tags = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    col_tags = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

	print "  "

    for k in 0..m.length-1 do
      print "%2s" % col_tags[k]
    end

    puts
    puts
  
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

def colocar_en_tablero(tablero,s)

# coloca un elemento s en el tablero m
#en la posicion (a,b)

  ocupado = false

  loop do

  	if ocupado == true then

     puts
     puts "La posicion ya esta ocupada"
     puts 

  	end
  
    print "Introduzca posicion: "
    a = get_keypressed.to_i 
    print a 
    b = get_keypressed.to_i
    print b
    sleep 0.4
    system('clear')
    
    if tablero[a][b] != s

      tablero[a][b]= s

      ocupado = false

    else

      ocupado = true 

      mostrar_tablero(barcos_jugador)     

    end
  
    break if ocupado == false 
  end
  
  system('clear')

end


def colocar_en_tablero_aleatorio(tablero,s)

ocupado = true

loop do 
a = rand(tablero.length) 
b = rand(tablero.length) 

if tablero[a][b] != s

  tablero[a][b] = s
  ocupado = false
end

break if ocupado == false
end

system ('clear')

end

def set_barcos_aleatorio(tablero, n)
 #configuracion inicial aleatoria
 # de n barcos en el tablero
 
 for k in 1..n do 
colocar_en_tablero_aleatorio(tablero, "\u2693")
end

end


def set_barcos(num_barcos)
# Pregunta al jugador el numero barcos 
# que se utilizaran en la partida


 

# incializamos el tablero de barcos 


barcos_jugador = fill_tablero("\u25a7",10)
barcos_compu = fill_tablero("\u25a7",10)

set_barcos_aleatorio(barcos_compu, num_barcos)

for k in 1..num_barcos do 
colocar_en_tablero(barcos_jugador, "\u2693")
mostrar_tablero(barcos_jugador)
sleep 0.5
end

system('clear')
puts "Barcos Jugador"
mostrar_tablero(barcos_jugador)
puts
puts"Barcos compu"
mostrar_tablero(barcos_compu)

gets
system('clear')
end 


###############  main ###########################################

def main




  num_symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  letras_list = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
  simbolo = [ "\u25a7", "\u2635","\u2693"  ]

  titulo
  anytecla
  
  login_menu
  num_barcos = select_num_barcos
  #num_barcos = 4 #modo debug
  set_barcos(num_barcos)
  
  loading_partida


end

main




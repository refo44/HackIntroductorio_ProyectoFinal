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

def validar_num_key(t)

  # verifica si la tecla ingresada es numerica

  valido = false

  for k in 0..9 do

      if t == k

        valido = true

      end

  end

  return valido
end

def anytecla
   puts "Presione cualquier tecla para continuar (s para salir del juego): "
  tecla = get_keypressed  

  system('clear') 

  if tecla.downcase == "s"  
    exit
  end
end

def mostrar_titulo
 system('clear') 

  puts
  puts "RIÑA DE PESCADORES"
  puts  

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

  return jugador_name
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

def set_barcos_aleatorio(tablero_barcos, num_barcos)

#configuracion aleatoria
# de num_barcos barcos en el tablero
 
  for k in 1..num_barcos do 

    colocar_en_tablero_aleatorio(tablero_barcos, "\u2693")

  end

end



def menu_set_barcos(barcos_jugador, num_barcos)
  loop do 
  system("clear")
    puts "Opciones:"
    puts "1.- Colocar barcos manualmente"
    puts "2.- Asignarlos de manera aleatoria"
    puts "s.- Salir del juego"
    print "Opcion: "
    op = "2" #debug
    #op = gets.chomp.downcase

    case op
    when "1" then 
    set_barcos(barcos_jugador, num_barcos)


    when "2" then  
    set_barcos_aleatorio(barcos_jugador, num_barcos)

    when "s" then exit

    else
      puts "Opcion incorrecta"
      puts "Presione Enter para continuar..."
      gets
  end

    
    break if op == "s" || op == "1" || op == "2"
  end

end


def set_barcos(tablero_barcos,num_barcos)

  for k in 1..num_barcos do 
  colocar_en_tablero(tablero_barcos, "\u2693")
  mostrar_tablero(tablero_barcos)
  sleep 0.5
  end
end 

 def mostrar_set_tablero(tablero, titulo)

system('clear')
  puts titulo
  mostrar_tablero(tablero)
  puts
  anytecla
end

def mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , tablero,titulo )

system('clear')
  puts " turno: #{nombre_turno}"
  puts " round: #{round}"
  puts " barcos de la computadora hundidos: #{num_barcos-num_barcos_compu}"
  puts "barcos del jugador hundidos: #{num_barcos-num_barcos_jugador}"
  puts
  puts titulo
  mostrar_tablero(tablero)
  puts
  anytecla
end


def check_atk(x ,y , tablero, simbolo, tablero_barcos)


 if tablero_barcos[x][y] == "\u25a7"
        
       tablero[x][y] = "\u2652"

      valor = 1

 else tablero_barcos[x][y] == "\u2693"

      tablero[x][y] = "\u2693"

     valor = 2

  end

return valor

# system('clear')

end


###############  main ###########################################

def main




  num_symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  letras_list = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
  simbolo = [ "\u25a7", "\u2652" ,"\u2693"  ]
  jugador_name = ["jugador", "compu" ]

# inicializamos los tableros de barcos 
  barcos_jugador = fill_tablero("\u25a7",10)
  barcos_compu = fill_tablero("\u25a7",10)

  #inicializamos los tableros de targets
  targets_jugador = fill_tablero("\u25a7",10)
  targets_compu = fill_tablero("\u25a7",10)

   #mostrar_titulo()
 # anytecla()

  
  #login_menu
  #num_barcos = select_num_barcos
  num_barcos = 10 #modo debug
 
 set_barcos_aleatorio(barcos_compu, num_barcos)
  #mostrar_set_tablero(barcos_compu,"barcos compu")
  
  menu_set_barcos(barcos_jugador, num_barcos)
  mostrar_set_tablero( barcos_jugador , "barcos jugador" ) 

  
  #loading_partida

  ## Partida
  
  num_barcos_jugador = num_barcos

  num_barcos_jugador =1 #debug

  num_barcos_compu = num_barcos

 round = 0



 loop do 

 
 turno = 0
 nombre_turno =jugador_name[turno]
 repetir = 0
 mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_jugador,"targets jugador")
 loop do
     sol = 0

     while sol == 0  do

     "Ingrese las coordenadas deseadas:"

      a = rand(targets_jugador.length)

      b = rand(targets_jugador.length)
    
    if targets_jugador[a][b] != "\u25a7"
        sol = 0
        else
        sol = check_atk(a,b,targets_jugador,simbolo,barcos_compu)
        end
      end

puts "sol: #{sol}"

break if repetir==0 || repetir>3
end


turno = 1
nombre_turno =jugador_name[turno]
repetir = 0

mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_jugador,"targets jugador")

loop do
     sol = 0

     while sol==0  do

        a = rand(targets_compu.length)

        b = rand(targets_compu.length)

        puts
        puts "target: #{targets_compu[a][b]}  \u25a7"
        puts
 
        if targets_compu[a][b] != "\u25a7"
        sol=0
        else
        sol=check_atk(a,b,targets_compu,simbolo,barcos_jugador)
        end
      end

puts "sol: #{sol}"

break if repetir==0 || repetir > 3
end

mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_compu,"targets compu")



round += 1 



  break if  num_barcos_jugador < 1 ||  num_barcos_compu < 1 || round >97
end


end

main




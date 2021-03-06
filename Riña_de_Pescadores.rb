# BatallaNaval.rb
 
 # Este programa fue desarrollado como proyecto final
 # del  Curso Introductorio de la  6ta promoción
 # de la  Academia {Hack} (ver archivo README.markdown)
 
 # autor: Rafael Figueredo
 
 require "colorize"

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
   print "Presione cualquier tecla para continuar"
   print " (s para salir del juego): ".colorize(:red)
  tecla = get_keypressed  

  system('clear') 

  if tecla.downcase == "s"  
    exit
  end
end

def make_titulo

  print "\u2693 ".colorize(:blue)
  print " RIÑA DE PESCADORES ".colorize(:background => :blue)
  print " \u2693".colorize(:blue)
  puts

end

def mostrar_titulo
 system('clear') 

  puts
   make_titulo()
  puts  

end
 

def loading_partida

  system('clear')
  make_titulo()
  puts "comenzando partida."
  sleep 0.4
  system('clear')
  make_titulo()
  puts "comenzando partida.."
  sleep 0.4
  system('clear')
  make_titulo()
  puts "comenzando partida..."
  puts
  sleep 0.4
  system('clear')
  make_titulo()
  puts "comenzando partida...."
  sleep 0.4
  system('clear')

end

 def login_menu
 	# Este procedimiento
 	# solicita el nombre del jugador
 	puts
 	make_titulo()
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
      puts " Debe escoger un numero entre 4 y 10 ".colorize(:background => :yellow)
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
    system('clear')
  	if ocupado == true then

     puts
     puts "La posicion ya esta ocupada"
     puts 

  	end
    mostrar_tablero(tablero)     
    puts
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
    
    op = gets.chomp.downcase
    #op = "2" #debug

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
  puts
  mostrar_tablero(tablero)
  puts
  anytecla
end

def mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , tablero,titulo, repetir, ultimo_atk )

system('clear')
  make_titulo()
  puts
  puts " turno: #{nombre_turno.upcase.colorize(:color => :red, :background => :yellow)}"
  puts " round: #{round}"
  puts " repetir: #{repetir}"
  puts
  puts " ultimo ataque: #{ultimo_atk}"
  puts " barcos de la computadora hundidos: #{num_barcos-num_barcos_compu}"
  puts " barcos del jugador hundidos: #{num_barcos-num_barcos_jugador}"
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

# inicializamos los tableros de targets
  targets_jugador = fill_tablero("\u25a7",10)
  targets_compu = fill_tablero("\u25a7",10)

 mostrar_titulo()
 anytecla()

  
  jugador_name[0] = login_menu()
  num_barcos = select_num_barcos()
  #num_barcos = 10 #debug
 
 set_barcos_aleatorio(barcos_compu, num_barcos)
  mostrar_set_tablero(barcos_compu,"barcos compu") #debug
  
  menu_set_barcos(barcos_jugador, num_barcos)
  mostrar_set_tablero( barcos_jugador , " Barcos de " + jugador_name[0].upcase ) 

  
  loading_partida()

  ####### Aqui Comienza la Partida ##############
  
  num_barcos_jugador = num_barcos

  #num_barcos_jugador =1 #debug

  num_barcos_compu = num_barcos

 round = 0
 ultimo_atk = "ninguno"


 loop do 

 
 turno = 0
 nombre_turno =jugador_name[turno]
 repetir = 0

 mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_jugador,"targets "+ nombre_turno.capitalize,repetir,ultimo_atk)
 
 loop do
    sol = 3

    loop  do

        if sol == 0 then 
            puts "No puede volver atacar la misma posicion "
        end

         mostrar_tablero(targets_jugador)
         print "Introduzca posicion: "
         a = get_keypressed.to_i #debug
         print a 
         b = get_keypressed.to_i #debug
         print b
         sleep 0.4
         system('clear')
     
           #a = rand(targets_jugador.length)
     
           #b = rand(targets_jugador.length)
         
          if targets_jugador[a][b] != "\u25a7"
             sol = 0
          else
             sol = check_atk(a,b,targets_jugador,simbolo,barcos_compu)
          end
        
        break if sol!=0
      end



if sol==2 then # ataque exitoso

ultimo_atk = "fue de " + nombre_turno.capitalize + " y resultó exitoso"
repetir += 1 
num_barcos_compu -= 1

elsif sol == 1  #ataque cayo en el agua
repetir = 0
ultimo_atk = "fue de " + nombre_turno.capitalize + " y cayo en el agua"

end 


mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_jugador,"targets "+ nombre_turno.capitalize,repetir,ultimo_atk)

break if repetir==0
end


turno = 1
nombre_turno =jugador_name[turno]
repetir = 0

mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_compu,"targets "+ nombre_turno.capitalize,repetir,ultimo_atk)

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


if sol==2 then # ataque exitoso

ultimo_atk = "fue de "+nombre_turno.capitalize+" y resultó exitoso"
repetir += 1 
num_barcos_jugador -= 1

elsif sol == 1  #ataque cayo en el agua
repetir = 0
ultimo_atk = "fue de "+nombre_turno.capitalize+" y cayó en el agua"

end 

mostrar_status_juego(round, nombre_turno, num_barcos, num_barcos_jugador, num_barcos_compu , targets_compu,"targets "+ nombre_turno.capitalize,repetir,ultimo_atk)
break if repetir==0 
end


round += 1 

  break if  num_barcos_jugador < 1 ||  num_barcos_compu < 1 || round >100
end

  if num_barcos_jugador > num_barcos_compu 

   
    mostrar_titulo()

    puts "felicitaciones ".upcase
    puts "¡es una victoria!".upcase
    puts 

    anytecla
    exit

    elsif num_barcos_jugador < num_barcos_compu

    puts " esta vez fue una derrota".upcase
    puts "¡si lo intentas de nuevo seguro la proxima lo lograras!".upcase
    puts 

anytecla

exit

else

mostrar_titulo()

puts 
puts "¡es un empate!".upcase
puts 

anytecla

exit
end

end
main





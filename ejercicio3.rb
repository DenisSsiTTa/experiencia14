def linea_continua
  puts '-------------------------------------------'
end

def menu
  linea_continua
  puts 'Ingresa el numero segun corresponda: '
  puts ' (1) Ingresar nueva Persona'
  puts ' (2) Editar datos de Persona'
  puts ' (3) Eliminar una Persona'
  puts ' (4) Cantidad de Personas Ingresadas'
  puts ' (5) Comunas de las Personas'
  puts ' (6) Lista de Personas entre 20 y 25 años'
  puts ' (7) Suma de las edades'
  puts ' (8) Promedio de las edades'
  puts ' (9) Lista de Personas por Genero'
  puts ' (10) Salir'
  linea_continua
end

def menu_edi
  linea_continua
  puts 'Que dato necesitas Editar: '
  puts ' (1) Edad'
  puts ' (2) Comuna'
  puts ' (3) Genero'
  linea_continua
end

def existe(llave, arreglo)
  if arreglo.has_key?(llave)
    true
  else
    puts 'No existe ese nombre de Item'
    false
  end
end

def existen(llave, valor, arreglo)
  if arreglo.has_key?(llave) && arreglo.has_value?(valor)
    true
  else
    false
  end
end

def actualiza_comuna(comuna_i)
  comuna_i.upcase!
  $comunas.push(comuna_i) if existe!(comuna_i, $comunas)
end

def actualiza_dato(nombre_i, dato, dato_val)
  $personas.each do |persona|
    if existen(:nombre, nombre_i, persona)
      if dato == 3
        dato_val.upcase!
        if existe(dato_val, genero)
          persona[dato] = dato_val
        else
          puts '-> ERROR en genero ingresado'
        end
      else
        dato_val.to_i! if dato == 1
        dato_val.upcase! if dato == 2
        persona[dato] = dato_val
      end
    end
  end
end

def veinte_veinticinco
  $personas.each do |persona|
    list_personas.push(persona[:nombre]) if 20 <= persona[:edad] && persona[:edad] <= 25
  end
  list_personas
end

def suma_edades
  total_edades = 0
  $personas.each do |persona|
    total_edades += persona[:edad]
  end
  total_edades
end

def por_genero
  mujeres = []
  hombres = []
  $personas.each do |persona|
    if persona[:genero] == 'M'
      mujeres.push(persona[:nombre])
    else
      hombres.push(persona[:nombre])
    end
  end
  puts mujeres
  puts hombres
end

genero = %w[M,F]

begin
  menu
  numero = gets.chomp.to_i
  $comunas = []
  $personas = []

  salida = false

  case numero
    when 1
      # Ingresar nueva Persona
      puts 'Ingresa Nombre de Persona: '
      nombre_i = gets.chomp.to_s
      puts 'Ingresa Edad de Persona: '
      edad_i = gets.chomp.to_i
      puts 'Ingresa Comuna de Persona: '
      comuna_i = gets.chomp
      actualiza_comuna(comuna_i)

      puts 'Ingresa genero de Persona: masculino(M), femenino(F)'
      tipo_i = gets.chomp.to_s
      tipo_i.upcase!

      if existe(tipo_i, genero)
        persona = { nombre: nombre_i, edad: edad_i, comuna: comuna_i, genero: tipo_i}
        $personas.push(persona)
      else
        puts '-> ERROR en genero ingresado'
      end

    when 2
      # Editar datos de Persona
      puts 'Ingresa Nombre de Persona: '
      nombre_i = gets.chomp.to_s
      menu_edi
      tipo_edi = gets.chomp.to_i

      case tipo_edi
        when 1, 2, 3
          puts 'Ingresa nuevo Valor '
          valor_i = gets.chomp
          $comunas = actualiza_comuna(comuna_i) if tipo_edi == 3
          $personas = actualiza_dato(nombre_i, tipo_edi, valor_i)
        else
          puts 'Error en selección.'
      end
    when 3
      # Eliminar una Persona
      puts 'Eliminar Item "nombre": '
      nombre_i = gets.chomp
      $personas.each do |i|
        $personas.delete(i) if existen(:nombre, nombre_i, i)
      end
    when 4
      # Cantidad de Personas Ingresadas
      puts $personas.length
    when 5
      # Comunas de las Personas
      puts $comunas
    when 6
      # Lista de Personas entre 20 y 25 annos
      puts veinte_veinticinco
    when 7
      # Suma de las edades
      puts suma_edades
    when 8
      # Promedio de las edades
      puts suma_edades * 1.0 / $personas.length
    when 9
      # Lista de Personas por Genero
      por_genero
    when 10
      # Salir
      puts 'Tu necesitas salir!!! Chao!'
      salida = true
    else
      puts 'Error en selección. Intente otro número.'
  end

end until salida

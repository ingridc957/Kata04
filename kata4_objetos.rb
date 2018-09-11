class DataHandling

  def initialize
    @colnames = []
    @col1 = []
    @col2 = []
    @spread = []
  end

  def data_reading(filename, n_colnames, n_col1, n_col2)
    File.readlines(filename).each do |line|
      @colnames << line.split[n_colnames]
      @col1 << line.split[n_col1].to_i
      @col2 << line.split[n_col2].to_i
    end

    if (filename == "weather.dat")
      @colnames = @colnames[2,30]
      @col1 = @col1[2,30]
      @col2 = @col2[2,30]
    end

    if (filename == "football.dat")
      @colnames.delete_at(18)
      @col1.delete_at(18)
      @col2.delete_at(18)

      @colnames.delete_at(0)
      @col1.delete_at(0)
      @col2.delete_at(0)
    end
    return  @colnames, @col1, @col2
  end


  def min_spread(names, col_1, col_2)
    for element in 0.. names.size-1
     @spread << (col_1[element] - col_2[element]).abs
    end
    minimum = names[@spread.index(@spread.min)]
    return minimum
  end
end

data_weather = DataHandling.new
data_football = DataHandling.new
# Columnas limpias
namesw, col_1w, col_2w = data_weather.data_reading("weather.dat", 0, 1, 2)
namesf, col_1f, col_2f = data_football.data_reading("football.dat", 1, 6, 8)

#Calculando mínima diferencia
min_football = data_football.min_spread(namesf, col_1f, col_2f)
min_day = data_weather.min_spread(namesw, col_1w, col_2w)

# puts "he aqui los días #{namesw}"
# puts "he aqui la máxima temperatura #{col_1w}"
# puts "he aqui la mínima temperatura #{col_2w}"

puts "The day number with the smallest temperature spread is June #{min_day} whit
a spread of "

# puts "he aqui los equipos #{namesf}"
# puts "he aqui los goles a favor #{col_1f}"
# puts "he aqui los goles en contra #{col_2f}"

puts "The team with the smallest difference goal in for and against is #{min_football}"

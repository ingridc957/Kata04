#weather data
day = []
maxi = []
mini = []

File.readlines("weather.dat").each do |line|
  day << line.split[0].to_i
  maxi << line.split[1].to_f
  mini << line.split[2].to_f
  #puts line[5..10]
end

#Eliminando lineas sin datos
2.times{
  day.shift
  maxi.shift
  mini.shift
}

spread = []
for element in 0..29
  spread << maxi[element] - mini[element]
end

day_min_spread = day[spread.index(spread.min)]
puts "The day number with the smallest temperature spread is June #{day_min_spread}"

# football data
team = []
goal = []
against = []

File.readlines("football.dat").each do |line|
  team << line.split[1]
  goal << line.split[6].to_i
  against << line.split[8].to_i
end

#Eliminando lineas sin datos
team.delete_at(18)
team.delete_at(0)
goal.delete_at(18)
goal.delete_at(0)
against.delete_at(18)
against.delete_at(0)

goal_diff = []
for element in 0.. team.size-1
  goal_diff << (goal[element] - against[element]).abs
end

team_min_diff = team[goal_diff.index(goal_diff.min)]

puts "The team with the smallest difference goal in for and against is #{team_min_diff}"

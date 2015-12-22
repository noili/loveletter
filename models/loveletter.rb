#! /.rvm/rubies/ruby-2.2.1/bin/ruby
require 'pry'

puts 'bienvenido a loveletter'

puts 'cuantos jugadores?'

n = gets.chomp.to_i

players = Array.new(n)

puts "usted selecciono #{n} jugadores"
#solo puedo elegir  2 - 4

cards = [1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8].shuffle


players[0] = [cards.pop]
players[1] = [cards.pop]
players[2] = [cards.pop]
players[3] = [cards.pop]

puts cards

i=0

while !cards.empty?
  players[i] << cards.pop
  puts "sus cartas son #{players[i]}"
  puts 'que carta desea jugar'
  juega = gets.chomp.to_i
  puts "usted jugo juega"
  players[i].delete_at(players[i].find_index(juega))
  i += 1
  if i == 3
    i = 0
  end
end

binding.pry

puts "el ganador es #{players.flatten.find_index(players.flatten.max)}"

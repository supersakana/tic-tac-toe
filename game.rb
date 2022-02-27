# ruby game.rb

class Player
  attr_accessor :name, :move

  def initialize(name, move)
    @name = name
    @move = move
  end

  def move_message
    puts "#{name}, make your move..."
  end

  def choice(choice)
    puts choice
    puts move
  end
end

puts 'Hello and welcome to tic-tac-toe!'

puts 'Player 1, what is your name?'
player_1 = Player.new(gets.chomp, 'X')
puts "Welcome #{player_1.name}, your move is #{player_1.move}"

puts 'Player 2, what is your name?'
player_2 = Player.new(gets.chomp, 'O')
puts "Welcome #{player_2.name}, your move is #{player_2.move}"

board = {
  a: %w[1 2 3],
  b: %w[4 5 6],
  c: %w[7 8 9]
}

def printer(game_board)
  game_board.each do |_key, value|
    p value
  end
end

printer(board)
player_1.move_message
player_1.choice(gets.chomp.upcase)

# ruby game.rb
class Player
  attr_accessor :name, :move

  @@player_count = 0

  def initialize(name, move)
    @name = name
    @move = move
    if @@player_count > 2
      puts '2 player game only'
    else
      @@player_count += 1
    end
  end

  def move_message
    puts "#{name}, make your move..."
  end

  def choice(choice)
    p choice.split('')
    p choice[0]
  end
end

puts 'Hello and welcome to tic-tac-toe!'

puts 'Player 1, what is your name?'
player_1 = Player.new(gets.chomp, 'X')
puts "Welcome #{player_1.name}, your move is #{player_1.move}"

puts 'Player 2, what is your name?'
player_2 = Player.new(gets.chomp, 'O')
puts "Welcome #{player_2.name}, your move is #{player_2.move}"

game_board = {
  a: %w[A1 A2 A3],
  b: %w[B1 B2 B3],
  c: %w[C1 C2 C3]
}

def printer(board)
  board.each do |_key, value|
    p value
  end
end

printer(game_board)

# player_1.move_message
# player_1.choice(gets.chomp.upcase)

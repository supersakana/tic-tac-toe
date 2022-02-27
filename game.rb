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

  def choice(_choice, board)
    board.each do |k, v|
      puts "#{k} = #{v}"
    end
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
  a: [1, 2, 3],
  b: [4, 5, 6],
  c: [7, 8, 9]
}

def printer(board)
  board.each do |_key, value|
    p value
  end
end

printer(game_board)
player_1.move_message
player_1.choice(gets.chomp.to_s, game_board)

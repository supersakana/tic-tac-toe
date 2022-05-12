# frozen_string_literal: true

# game messages
module Display
  def opening
    puts 'Welcome to Tic-Tac_Toe'
  end

  def display_prompt(name)
    puts "#{name}, make your move..."
  end

  def display_invalid
    puts 'Invalid Move'
  end

  def display_win(name)
    puts "Congrats #{name}! You're the winner"
  end
end

# frozen_string_literal: true

# game messages
module Display
  def opening
    puts 'Welcome to Tic-Tac_Toe'
  end

  def display_name(num)
    puts "Player #{num} , what is your name?"
    gets.chomp
  end

  def display_welcome(name, move)
    puts "Welcome #{name}, your move is #{move}"
  end

  def display_prompt(name)
    puts "#{name}, make your move..."
  end
end

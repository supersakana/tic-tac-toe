# frozen_string_literal: true

# game messages
module Display
  def opening
    puts 'Welcome to Tic-Tac_Toe'
  end

  def player_name(count)
    puts "Player #{count} , what is your name?"
  end
end
